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

        for (field in fields)
        {
            switch (field.kind)
            {
                case FVar(_,_):
                    if (hasPublicAccess(field))
                    {
                        _fieldSetters.push(macro { _fields.set($v{index++}, $v{field.name}); });
                    }
                default:

            }
        }

        switch (__constructor.kind)
        {
            case FFun(fun): fun.expr = macro {
                super();

                $a{_fieldSetters};
            };
            default:
        }

        return fields;
    }

    static function hasPublicAccess(field:Field)
    {
        for (access in field.access)
        {
            if (access == APublic)
                return true;
        }
        return false;
    }

}


#end