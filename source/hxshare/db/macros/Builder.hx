package hxshare.db.macros;
#if macro

import haxe.macro.Context;
import haxe.macro.Expr;

class Builder
{

    public static macro function build():Array<Field>
    {
        var fields = Context.getBuildFields();


        var __constructor:Field = null;
        for (field in fields)
        {
            if (field.name == "new")
                __constructor = field;
        }

        var _fieldSetters = [];
        var index = 0;
        var idFieldName = "";

        for (field in fields)
        {
            switch (field.kind)
            {
                case FVar(t,_):
                    for (meta in field.meta)
                    {
                        if (meta.name == "primary")
                        {
                            switch (t)
                            {
                                case TPath(p):
                                    if (p.name == "Int" || p.name == "UInt")
                                    {
                                        idFieldName = field.name;
                                    }
                                    else
                                    {
                                        Context.error("@primary can only be assigned to a field of type `Int` or `UInt`.", Context.currentPos());
                                    }
                                default:
                            }
                        }
                    }
                default:

            }
        }

        if (idFieldName == "")
        {
            Context.error("You must have a @primary meta on at least one field of type `Int` or `UInt`.", Context.currentPos());
        }

        switch (__constructor.kind)
        {
            case FFun(fun): fun.expr = macro {
                super();

                _idField = $v{idFieldName};
            };
            default:
        }

        return fields;
    }

}


#end