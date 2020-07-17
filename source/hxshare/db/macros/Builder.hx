package hxshare.db.macros;
#if macro

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Compiler;

enum DateTimeFormat
{
    Standard;
    DateTime;
    Time;
    Year;
    Timestamp;
}

class Builder
{

    static var fields:Array<Field>;
    static var tableName:String;

    public static macro function build():Array<Field>
    {
        fields = Context.getBuildFields();
        var cls = Context.getLocalClass().get();
        if (cls.meta != null)
        {
            var found = false;
            for (m in cls.meta.get())
            {
                if (m.name == "tableName")
                {
                    switch (m.params[0].expr)
                    {
                        case EConst(c):
                            tableName = switch (c) {
                                case CString(s, kind): s;
                                default: "";
                            }
                        default:
                    }
                    found = true;
                }
            }

            if (!found)
                tableName = cls.name.toLowerCase();
        }
        else 
        {
            tableName = cls.name.toLowerCase();
        }


        
        if (Context.defined("php"))
        {
            gen_php_mysql_insert();
            gen_php_mysql_update();
        }

        return fields;
    }

    static function gen_php_mysql_insert()
    {
        var fieldNames = [];
        var fieldValues = [];
        var first = true;

        var dateTimeFormat = DateTimeFormat.Standard;
        var primaryKeyField = "";

        for (f in fields)
        {
            switch (f.kind)
            {
                case FVar(t, e):
                    if (f.meta != null)
                    {
                        var skipField = false;
                        for (m in f.meta)
                        {
                            if (m.name == "primaryKey")
                            {
                                primaryKeyField = f.name;
                                skipField = true;
                            }
                            else if (m.name == "dateFormat")
                            {
                                dateTimeFormat = switch(m.params[0].expr)
                                {
                                    case EConst(c): switch(c) {
                                        case CString(s, kind): {
                                            if (s == "DateTime") DateTimeFormat.DateTime;
                                            else if (s == "Time") DateTimeFormat.Time;
                                            else if (s == "Year") DateTimeFormat.Year;
                                            else if (s == "Timestamp") DateTimeFormat.Timestamp;
                                            else DateTimeFormat.Standard;
                                        }
                                        default: DateTimeFormat.Standard;
                                    }
                                    default: DateTimeFormat.Standard;
                                };
                            }
                        }

                        if (skipField)
                            continue;
                    }
        
                    if (first)
                        fieldNames.push(macro { query += "" + $v{f.name}; });
                    else 
                        fieldNames.push(macro { query += ", " + $v{f.name}; });
        
                    switch (f.kind)
                    {
                        case FVar(t, e):
                            var isString = false;
                            var isDate = false;
                            
                            switch (t)
                            {
                                case TPath(p):
                                    if (p.name == "Date")
                                    {
                                        isDate = true;

                                        if (!first)
                                            fieldValues.push(macro { query += ", "; });
        
                                        switch (dateTimeFormat)
                                        {
                                            case Standard:
                                                fieldValues.push(macro {
                                                    query += "'" + DateTools.format($i{f.name}, "%F") + "'";
                                                });
                                            case DateTime:
                                                fieldValues.push(macro {
                                                    query += "'" + $i{f.name}.toString() + "'";
                                                });
                                            case Time:
                                                fieldValues.push(macro {
                                                    query += "'" + DateTools.format($i{f.name}, "%T") + "'";
                                                });
                                            case Year:
                                                fieldValues.push(macro {
                                                    query += "'" + DateTools.format($i{f.name}, "%Y") + "'";
                                                });
                                            case Timestamp:
                                                fieldValues.push(macro {
                                                    query += "'" + $i{f.name}.getTime() + "'";
                                                });
                                        }
        
                                        first = false;
                                        continue;
                                    }
                                default:
                            }

                            switch (t)
                            {
                                case TPath(p):
                                    if (p.name == "String")
                                        isString = true;
                                default:
                            }
        
                            if (isString)
                            {
                                if (first)
                                    fieldValues.push(macro {
                                        query += "'" + pattern.replace($i{f.name}, "\\\x00") + "'"; 
                                    });
                                else
                                    fieldValues.push(macro {
                                        query += ", '" + pattern.replace($i{f.name}, "\\\x00") + "'"; 
                                    });
                            }
                            else 
                            {
                                if (first)
                                    fieldValues.push(macro { query += "" + $i{f.name} + ""; });
                                else 
                                    fieldValues.push(macro { query += ", " + $i{f.name} + ""; });
                            }
                        default:
                    }
        
                    first = false;
                default:
            }
        }

        var insertBody = macro {
            var pattern = ~/[\x00\x0A\x0D\x1A\x22\x25\x27\x5C\x5F]/;
            var query = 'INSERT INTO ' + hxshare.db.Connection.getDatabaseName() + '.' + $v{tableName};
            query += ' (';
            $a{fieldNames};
            
            query += ' ) VALUES (';
            $a{fieldValues};
            query += ');';

            var db = hxshare.db.Connection.instance.getDatabaseObject();
            var result = db.query(query);
            if (!result)
            {
                php.Lib.print("Something went wrong trying to execute the following query:<br>");
                php.Lib.print(query + "<br><br>");
                return false;
            }
            else
            {
                $i{primaryKeyField} = cast db.insert_id;
            }

            return true;
        };

        var insertFunction:Function = {
            ret: macro :Bool,
            expr: insertBody,
            args: []
        };

        var insertField:Field = {
            pos: Context.currentPos(),
            name: "insert",
            kind: FFun(insertFunction),
            access: [APublic]
        };

        fields.push(insertField);
    }

    static function gen_php_mysql_update()
    {
        var fieldValues = [];
        var first = true;

        var dateTimeFormat = DateTimeFormat.Standard;
        var primaryKeyField = "";

        for (f in fields)
        {
            switch (f.kind)
            {
                case FVar(t, e):
                    if (f.meta != null)
                    {
                        var skipField = false;
                        for (m in f.meta)
                        {
                            if (m.name == "primaryKey")
                            {
                                primaryKeyField = f.name;
                                skipField = true;
                            }
                            else if (m.name == "dateFormat")
                            {
                                dateTimeFormat = switch(m.params[0].expr)
                                {
                                    case EConst(c): switch(c) {
                                        case CString(s, kind): {
                                            if (s == "DateTime") DateTimeFormat.DateTime;
                                            else if (s == "Time") DateTimeFormat.Time;
                                            else if (s == "Year") DateTimeFormat.Year;
                                            else if (s == "Timestamp") DateTimeFormat.Timestamp;
                                            else DateTimeFormat.Standard;
                                        }
                                        default: DateTimeFormat.Standard;
                                    }
                                    default: DateTimeFormat.Standard;
                                };
                            }
                        }

                        if (skipField)
                            continue;
                    }
        
                    switch (f.kind)
                    {
                        case FVar(t, e):
                            var isString = false;
                            var isDate = false;
                            
                            switch (t)
                            {
                                case TPath(p):
                                    if (p.name == "Date")
                                    {
                                        isDate = true;

                                        if (!first)
                                            fieldValues.push(macro { query += ", "; });
        
                                        switch (dateTimeFormat)
                                        {
                                            case Standard:
                                                fieldValues.push(macro {
                                                    query += $v{f.name} + " = '" + DateTools.format($i{f.name}, "%F") + "'";
                                                });
                                            case DateTime:
                                                fieldValues.push(macro {
                                                    query += $v{f.name} + " = '" + $i{f.name}.toString() + "'";
                                                });
                                            case Time:
                                                fieldValues.push(macro {
                                                    query += $v{f.name} + " = '" + DateTools.format($i{f.name}, "%T") + "'";
                                                });
                                            case Year:
                                                fieldValues.push(macro {
                                                    query += $v{f.name} + " = '" + DateTools.format($i{f.name}, "%Y") + "'";
                                                });
                                            case Timestamp:
                                                fieldValues.push(macro {
                                                    query += $v{f.name} + " = " + $i{f.name}.getTime() + "";
                                                });
                                        }
        
                                        first = false;
                                        continue;
                                    }
                                default:
                            }

                            switch (t)
                            {
                                case TPath(p):
                                    if (p.name == "String")
                                        isString = true;
                                default:
                            }
        
                            if (isString)
                            {
                                if (first)
                                    fieldValues.push(macro {
                                        query += $v{f.name} + " = '" + pattern.replace($i{f.name}, "\\\x00") + "'"; 
                                    });
                                else
                                    fieldValues.push(macro {
                                        query += ", " + $v{f.name} + " = '" + pattern.replace($i{f.name}, "\\\x00") + "'"; 
                                    });
                            }
                            else 
                            {
                                if (first)
                                    fieldValues.push(macro { query += $v{f.name} + " = " + $i{f.name} + ""; });
                                else 
                                    fieldValues.push(macro { query += ", " + $v{f.name} + " = " + $i{f.name} + ""; });
                            }
                        default:
                    }
        
                    first = false;
                default:
            }
        }

        var updateBody = macro {
            var pattern = ~/[\x00\x0A\x0D\x1A\x22\x25\x27\x5C\x5F]/;
            var query = 'UPDATE ' + hxshare.db.Connection.getDatabaseName() + '.' + $v{tableName};
            query += ' SET ';
            $a{fieldValues};
            query += ' WHERE ' + $v{primaryKeyField} + ' = ' + $i{primaryKeyField};

            var db = hxshare.db.Connection.instance.getDatabaseObject();
            var result = db.query(query);
            if (!result)
            {
                php.Lib.print("Something went wrong trying to execute the following query:<br>");
                php.Lib.print(query + "<br><br>");
                return false;
            }

            return true;
        };

        var updateFunction:Function = {
            ret: macro :Bool,
            expr: updateBody,
            args: []
        };

        var updateField:Field = {
            pos: Context.currentPos(),
            name: "update",
            kind: FFun(updateFunction),
            access: [APublic]
        };

        fields.push(updateField);
    }

}

#end