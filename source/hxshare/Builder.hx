package hxshare;
#if macro

import haxe.macro.Type;
import haxe.macro.Context;
import haxe.macro.Expr;

class Builder
{

//
// Begin Macro API
//

    static var _types:Array<String>;
    static var _clientTypes:Array<ComplexType>;
    static var _serverTypes:Array<ComplexType>;

    static var _structures:Array<Structure>;
    static var _currentStructure:Int = -1;

    public static function init()
    {
        _structures = [];

        _types = [];
        _clientTypes = [];
        _serverTypes = [];

        addType("id", macro :Int, macro :sys.db.Types.SId);
        addType("shorttext", macro :String, macro :sys.db.Types.STinyText);
        addType("longtext", macro :String, macro :sys.db.Types.SText);
        addType("bool", macro :Bool, macro :sys.db.Types.SBool);
        addType("int", macro :Int, macro :sys.db.Types.SInt);
        addType("float", macro :Float, macro :sys.db.Types.SFloat);
    }

    public static function addType(identifier:String, clientType:ComplexType, serverType:ComplexType)
    {
        _types.push(identifier);
        _clientTypes.push(clientType);
        _serverTypes.push(serverType);
    }

    public static function beginStructure(name:String)
    {
        var structure = new Structure();
        structure.name = name;
        _structures.push(structure);
        _currentStructure++;
    }

    public static function addField(typeName:String, identifier:String, ?searchable:Bool = false)
    {
        var field = new CField();
        field.typeName = typeName;
        field.identifier = identifier;
        field.searchable = searchable;
        _structures[_currentStructure].fields.push(field);
    }

    public static function addRestRoute(rootURL:String)
    {
        _structures[_currentStructure].restRootURL = rootURL;
    }

    public static function build()
    {
        buildShared();

        if (Context.defined("php"))
        {
            buildServer();
        }
    }

//
// End Macro API
//
// Begin Generated Code
//

    public static macro function generateServerREST():Array<Field>
    {
        var fields = Context.getBuildFields();

        //
        // `router()` function. To be called inside the main function for functionality.
        //

        {
            var caseValues = [];
            for (struct in _structures)
            {
                var classType = macro $i{struct.name};

                caseValues.push(macro
                {
                    if (routes[0] == $v{struct.restRootURL})
                    {
                        if (method != "GET")
                        {
                            if (routes.length == 2)
                            {
                                var id = Std.parseInt(routes[1]);
                                Lib.print(Json.stringify($classType.modify(method, id)));
                            }
                            else
                            {
                                Web.setReturnCode(500);
                                Lib.print("Method '" + method + "' is used for the URL route '" + routes[0] + "' but no `id` was given.");
                            }
                        }
                        else
                        {
                            if (routes.length >= 2)
                            {
                                if (routes[1] == "all")
                                {
                                    Lib.print(Json.stringify($classType.all()));
                                }
                                else if (routes[1] == "search")
                                {
                                    Lib.print(Json.stringify($classType.search(routes[2])));
                                }
                                else
                                {
                                    var id = Std.parseInt(routes[1]);
                                    if (id != null)
                                    {
                                        Lib.print(Json.stringify($classType.modify("GET", id)));
                                    }
                                }
                            }
                        }
                    }
                });
            }

            var routerBody = macro {
                var page = php.Web.getParams().get("page");
                var routes = page.split("/");
                var method = php.Web.getMethod();

                if (routes.length > 0)
                {
                    $a{caseValues};
                }
            };

            var routerFunction:Function = {
                args: [],
                expr: routerBody,
                ret: null
            };

            var routerField:Field = {
                access: [AStatic],
                kind: FFun(routerFunction),
                name: "router",
                pos: Context.currentPos()
            };

            fields.push(routerField);
        }

        return fields;
    }

    static function buildShared()
    {
        for (struct in _structures)
        {
            var typeFields = [];

            for (f in struct.fields)
            {
                var type = getClientType(f.typeName);
                if (type == null)
                    Context.error('`${f.typeName}` type not found.', Context.currentPos());

                typeFields.push({
                    kind: FVar(type),
                    pos: Context.currentPos(),
                    name: f.identifier,
                    meta: [
                        {
                            name: ":optional",
                            pos: Context.currentPos()
                        }
                    ]
                }); 
            }

            var def:TypeDefinition = {
                fields: typeFields,
                kind: TDAlias(TAnonymous(typeFields)),
                name: "T" + struct.name,
                pack: [ "shared" ],
                pos: Context.currentPos()
            };

            Context.defineType(def);
        }

    }

    static function buildServer()
    {
        for (struct in _structures)
        {
            var typeFields = [];
            var sharedTypeMembers = [];
            var searchableFields = [];

            for (f in struct.fields)
            {
                var type = getServerType(f.typeName);
                if (type == null)
                    Context.error('`${f.typeName}` type not found.', Context.currentPos());

                typeFields.push({
                    kind: FVar(type),
                    pos: Context.currentPos(),
                    name: f.identifier,
                    meta: [
                        {
                            name: ":optional",
                            pos: Context.currentPos()
                        }
                    ]
                });

                sharedTypeMembers.push(f.identifier);

                if (f.searchable)
                    searchableFields.push(f.identifier);
            }

            //
            // `toTypedef` function
            //
            {
                var type = Context.toComplexType(Context.getType("shared.T" + struct.name));
                var assigns = [];

                for (i in 0...sharedTypeMembers.length)
                {
                    var mName:String = sharedTypeMembers[i];

                    var e = {
                        expr: EField(macro this, mName),
                        pos: Context.currentPos()
                    };

                    assigns.push({
                        field: mName,
                        expr: e
                    });
                }

                var const_type = { expr: EObjectDecl(assigns), pos: Context.currentPos() };

                var toTypedefBody = macro {
                    var data:$type = ${const_type};
                    return data;
                };

                var toTypedefFunc:Function = {
                    expr: toTypedefBody,
                    ret: type,
                    args: []
                };

                var toTypedefField:Field = {
                    kind: FFun(toTypedefFunc),
                    access: [ APublic ],
                    name: "toTypedef",
                    pos: Context.currentPos()
                };

                typeFields.push(toTypedefField);
            }

            var def:TypeDefinition = {
                fields: typeFields,
                kind: TDClass({
                    name: "Object",
                    pack: [ "sys", "db" ]
                }),
                name: struct.name,
                pack: [ "data" ],
                pos: Context.currentPos(),
                meta: [
                    {
                        name: ":build",
                        pos: Context.currentPos(),
                        params: [
                            macro hxshare.Builder.finish($v{searchableFields})
                        ]
                    }
                ]
            };

            Context.defineType(def);
        }
    }

    static function getClientType(type:String)
    {
        for (i in 0..._types.length)
        {
            var t = _types[i];
            if (t == type)
                return _clientTypes[i];
        }

        return null;
    }

    static function getServerType(type:String)
    {
        for (i in 0..._types.length)
        {
            var t = _types[i];
            if (t == type)
                return _serverTypes[i];
        }

        return null;
    }

    public static macro function finish(searchableFields:Array<String>):Array<Field>
    {
        var fields = Context.getBuildFields();
        var className = Context.getLocalClass().get().name;

        //
        // `all()` - Gets all the records for the server type.
        //

        {
            var allBody = macro {
                var items = manager.all();
                var results = [];
                for (item in items)
                    results.push(item.toTypedef());
                return results;
            };

            var allFunction:Function = {
                args: [],
                expr: allBody,
                ret: null
            };

            var allField:Field = {
                access: [APublic, AStatic],
                kind: FFun(allFunction),
                name: "all",
                pos: Context.currentPos()
            };

            fields.push(allField);
        }

        //
        // `modify()` - Sets specific values dependent on RESTful notation for a given Database Object.
        // Example: POST user/5  - Will UPDATE the User object with id 5.
        //

        {
            var sharedTypePath = "shared.T" + className;
            var tType = Context.toComplexType(Context.getType(sharedTypePath));
            var cType = Context.toComplexType(Context.getType(className));
            var cTypePath:TypePath = {
                name: className,
                pack: [ "data" ]
            };

            var dataSetters = [];
            switch (tType)
            {
                case TAnonymous(fields):
                {
                    for (i in 0...fields.length)
                    {
                        var f = fields[i];
                        var fieldName = f.name;
                        dataSetters.push(macro { item.$fieldName = data.$fieldName; });
                    }
                }
                default:
            }

           
            var modifyBody = macro {
                if (method == "GET" && id > -1)
                {
                    return manager.get(id).toTypedef();
                }
                else if (method == "DELETE" && id > -1)
                {
                    var item = manager.get(id);
                    item.delete();
                    return null;
                }
                else
                {
                    var input = sys.io.File.getContent("php://input");
                    var data:$tType = haxe.Json.parse(input);
                    var item:$cType = null;

                    if (method == "PUT")
                        item = new $cTypePath();
                    else if (method == "POST" && id > -1)
                        item = manager.get(id);
                    
                    if (id == null)
                    {
                        php.Web.setReturnCode(500);
                        php.Lib.print('The item with the id ' + id + ' does not exist.');
                        return null;
                    }

                    $a{dataSetters};

                    if (method == "PUT")
                        item.insert();
                    else if (method == "POST")
                        item.update();
                    
                    return item.toTypedef();
                }
            };

            var modifyFunction:Function = {
                args: [
                    {
                        name: "method",
                        type: macro :String
                    },
                    {
                        name: "id",
                        type: macro :Int,
                        opt: true,
                        value: macro -1
                    }
                ],
                expr: modifyBody,
                ret: null
            };

            var modifyField:Field = {
                access: [APublic, AStatic],
                kind: FFun(modifyFunction),
                name: "modify",
                pos: Context.currentPos()
            };

            fields.push(modifyField);
        }

        //
        // `search()` - Search the specified default searchable field. Used when a field is
        // marked searchable.
        //
        {
            if (searchableFields.length > 0)
            {
                var searchable = "$" + searchableFields[0];

                var searchBody = macro {
                    var items = manager.search($i{searchable}.like(value));
                    var results = [];
                    for (item in items)
                        results.push(item.toTypedef());
                    return results;
                };

                var searchFunction:Function = {
                    args: [
                        {
                            name: "value",
                            type: macro :String
                        }
                    ],
                    expr: searchBody,
                    ret: null
                };

                var searchField:Field = {
                    access: [APublic, AStatic],
                    kind: FFun(searchFunction),
                    name: "search",
                    pos: Context.currentPos()
                };

                fields.push(searchField);
            }
        }

        return fields;
    }

//
// End Generated Code
//

}
#end