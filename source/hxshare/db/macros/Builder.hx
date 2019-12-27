package hxshare.db.macros;
#if macro

import haxe.macro.Context;
import haxe.macro.Expr;

class Builder
{

    public static macro function build():Array<Field>
    {
        var fields = Context.getBuildFields();
        var cls = Context.getLocalClass();
        var clsComplex = Context.toComplexType(TInst(cls, []));

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
                        if (meta.name == ":primaryKey")
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
                                        Context.error("@:primaryKey can only be assigned to a field of type `Int` or `UInt`.", Context.currentPos());
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
            Context.error("You must have a @:primaryKey meta on at least one field of type `Int` or `UInt`.", Context.currentPos());
        }

        switch (__constructor.kind)
        {
            case FFun(fun): fun.expr = macro {
                super();

                _idField = $v{idFieldName};
            };
            default:
        }

        var instanceFields = [];
        function hasPublicAccess(access:Array<Access>)
        {
            for (a in access)
                if (a == APublic)
                    return true;
            
            return false;
        }

        for (f in fields)
        {
            switch (f.kind)
            {
                case FVar(t, _):
                    if (hasPublicAccess(f.access))
                    {
                        instanceFields.push(f);
                    }
                default:
            }
        }


        /**
        * The `clone()` function.
        **/
        {
            var instancePath:TypePath = {
                name: cls.get().name,
                pack: cls.get().pack
            };

            var memberAssigns = [];
            for (f in instanceFields)
            {
                var fName = f.name;
                var ignore = false;
                for (meta in f.meta)
                {
                    if (meta.name == ":primaryKey")
                    {
                        ignore = true;
                        break;
                    }
                }

                if (ignore)
                    continue;

                memberAssigns.push(macro { instance.$fName = this.$fName; });
            }

            var cloneBody = macro {
                var instance = new $instancePath();
                $a{memberAssigns};
                return instance;
            };

            var cloneFunction:Function = {
                expr: cloneBody,
                ret: clsComplex,
                args: []
            };

            var cloneField:Field = {
                name: "clone",
                kind: FFun(cloneFunction),
                access: [APublic],
                pos: Context.currentPos()
            };

            fields.push(cloneField);
        }

        return fields;
    }

}


#end