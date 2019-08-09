package hxshare.db.vendors;

import hxshare.db.DBObject;

#if php
import php.db.PDO;
import php.db.PDOException;
import php.Const;
import php.Lib;
import php.Syntax;
#end

class Mysql
{

    #if php
    static var _dbConn:PDO;
    #end

    public static function connect(host:String, user:String, pass:String, database:String = "", ?port:Int = 3306, ?socket:String = "")
    {
        #if php
        try {
            _dbConn = new PDO('mysql:host=$host;dbname=$database;port=$port;socket=$socket', user, pass);
        }
        catch (ex:PDOException) {
            return false;
        }

        #end

        return true;
    }

    public static function createDatabase(dbName:String)
    {
        #if php
        var sql = 'CREATE DATABASE $dbName';
        try {
            _dbConn.exec(sql);
        }
        catch (ex:PDOException) {
            return false;
        }

        return true;
        #end
    }

    public static function select<T>(object:T, ?filter:Map<String, Dynamic>, ?options:Dynamic):Array<T>
    {
        var table = '';
        var cls = Type.getClass(object);
        table = Type.getClassName(cls);
        table = table.substr(table.lastIndexOf(".") + 1);

        var results = new Array<T>();
        var query = '';
        var bindings = [];

        query = 'SELECT * FROM `$table`';
        if (filter != null)
        {
            if (filter.keys().hasNext())
            {
                query += ' WHERE ';
                for (k => v in filter)
                {
                    if (Reflect.hasField(object, k))
                    {
                        query += '$k = :$k ';
                        bindings.push(k);
                    }
                }
            }
        }

        if (options != null)
        {
            if (options.orderBy != null)
            {
                if (Std.is(options.orderBy, String))
                {
                    var hasNegative = false;
                    if (options.orderBy.indexOf("-") == 0)
                        hasNegative = true;
                    
                    var fieldName = options.orderBy;
                    if (hasNegative)
                    {
                        fieldName = options.orderBy.substr(1);
                        query += ' ORDER BY $fieldName DESC';
                    }
                    else
                    {
                        query += ' ORDER BY $fieldName';
                    }
                }
            }

            if (options.limit != null)
            {
                if (Std.is(options.limit, Int))
                {
                    query += ' LIMIT ${options.limit}';
                }
                else if (Std.is(options.limit, Array))
                {
                    query += ' LIMIT ${options.limit[1]}, ${options.limit[0]}';
                }
            }
        }

        #if php
        var stmt = _dbConn.prepare(query, Lib.toPhpArray([]));
        for (b in bindings)
        {
            var value = filter[b];
            stmt.bindParam(b, value);
        }
        Syntax.code("$stmt->execute()");

        var queryResults = stmt.setFetchMode(PDO.FETCH_ASSOC);
        for (k => v in stmt.fetchAll().keyValueIterator())
        {
            var instance = Type.createInstance(cls, []);
            Syntax.foreach(v, (col, value) -> {
                Reflect.setField(instance, col, value);
            });
            results.push(instance);
        }
        #end

        return results;
    }

    public static function insert(table:String, data:Dynamic)
    {

    }

    public static function update(table:String, data:Dynamic, options:Dynamic)
    {

    }

    public static function delete(table:String, options:Dynamic)
    {

    }

    public static function callProcedure(procedure:String, args:Array<Dynamic>)
    {

    }

    public static function close()
    {
        
    }


    static function getOperator(value:String)
    {
        var result = "";
        for (i in 0...value.length)
        {
            var char = value.charAt(i);
            if (char == ":")
                continue;
            else if (char == " ")
                break;
            else
                result += char;
        }
        return result;
    }

    static function getRawValue(value:String)
    {
        var result = "";
        var isOperator = false;
        if (value.indexOf(":") == 0)
            isOperator = true;
        
        if (!isOperator)
        {
            if (value.indexOf(" ") == -1)
                return value;
            else
                return value.substr(0, value.indexOf(" "));
        }
        else
        {
            var spaceFound = false;
            for (i in 0...value.length)
            {
                var char = value.charAt(i);
                if (char == " ")
                {
                    if (spaceFound)
                    {
                        return result;
                    }
                    else
                    {
                        spaceFound = true;
                    }
                }
                else
                {
                    if (spaceFound)
                        result += char;
                }
            }
        }

        return "";
    }

}