package hxshare;
import haxe.rtti.CType.MetaData;
#if macro

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

    /**
    * Initialise the Builder.
    **/
    public static function init()
    {
        _structures = [];

        _types = [];
        _clientTypes = [];
        _serverTypes = [];

        addType("id", macro :Int, macro :sys.db.Types.SId);
        addType("shorttext", macro :String, macro :sys.db.Types.STinyText);
        addType("text", macro :String, macro :sys.db.Types.SSmallText);
        addType("longtext", macro :String, macro :sys.db.Types.SText);
        addType("bool", macro :Bool, macro :sys.db.Types.SBool);
        addType("int", macro :Int, macro :sys.db.Types.SInt);
        addType("float", macro :Float, macro :sys.db.Types.SFloat);
        addType("date", macro :String, macro :sys.db.Types.SDate);
        addType("time", macro :Date, macro :sys.db.Types.STimeStamp);
        addType("datetime", macro :String, macro :sys.db.Types.SDateTime);
    }

    /**
    * Add a Type that can be used as the common identifier for both the client and server.
    * @param identifier The name of the type.
    * @param clientType A `ComplexType` representing what should be generated when this type is resolved on the client-side.
    * @param serverType A `ComplexType` representing what should be generated when this type is resolved on the server-side.
    **/
    public static function addType(identifier:String, clientType:ComplexType, serverType:ComplexType)
    {
        _types.push(identifier);
        _clientTypes.push(clientType);
        _serverTypes.push(serverType);
    }

    /**
    * Create a new structure that defines either a class or typedef depending on output target.
    * @param name The name to give to the structure. Typedef's are generated prefixed with "T" in the `shared` package, 
    * while the generated class will keep the given name and will be placed in the `data` package.
    **/
    public static function beginStructure(name:String)
    {
        var structure = new Structure();
        structure.name = name;
        _structures.push(structure);
        _currentStructure++;
    }

    /**
    * Add a field to a structure. Must be called after `beginStructure` is called.
    * @param typeName This is the named type, such as when `addType` is called to define a specific type.
    * @param identifier The name of the field when generated.
    * @param isPrimary If true, marks the field as an @:id in the database class when generated on the server.
    * @param displayName (Optional) If generating a form, the `displayName` is used to identify the form field against this field.
    * @param searchable (Optional) Determines if this field is searchable. Generates the `search()` function of the structure on the server.
    **/
    public static function addField(typeName:String, identifier:String, ?isPrimary:Bool, ?displayName:String = "", ?searchable:Bool = false)
    {
        if (_currentStructure == -1)
            return;

        var field = new CField();
        field.typeName = typeName;
        field.isPrimary = isPrimary;
        field.identifier = identifier;
        field.searchable = searchable;
        field.displayName = displayName;
        _structures[_currentStructure].fields.push(field);
    }

    /**
    * Defines the root name for this structure when accessing it via a REST API.
    *
    * @param rootURL The root name for this structure.
    **/
    public static function addRestRoute(rootURL:String)
    {
        _structures[_currentStructure].restRootURL = rootURL;
    }

    /**
    * Usually called at macro-initialisation time, this will build and generate code respective of the target language.
    **/
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

    /**
    * Usually called against a class using `@:build`, this will generate a static `router()` function.
    * The router function generated takes two parameters:
    *
    *   `url` is a string, which is the URL given in RESTful notation.
    *   `method` is the HTTP method retrieved.
    **/
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
                var searchableField = "";

                for (f in struct.fields)
                {
                    if (f.searchable)
                    {
                        searchableField = f.identifier;
                        break;
                    }
                }

                var caseExpr:Expr = null;

                if (searchableField != "")
                {
                    var searchable:Expr = {
                        expr: EObjectDecl([{ field: searchableField, expr: macro routes[2] }]),
                        pos: Context.currentPos()
                    };

                    caseExpr = macro
                    {
                        if (routes[0] == $v{struct.restRootURL})
                        {
                            if (method != "GET")
                            {
                                if (routes.length == 1)
                                {
                                    Lib.print(Json.stringify($classType.modify(method)));
                                }
                                else if (routes.length == 2)
                                {
                                    if (routes[2] == "search")
                                    {
                                        var value = sys.io.File.getContent("php://input");
                                        var data = Json.parse(value);
                                        Lib.print(Json.stringify($classType.search(data)));
                                    }
                                    else
                                    {
                                        var id = Std.parseInt(routes[1]);
                                        Lib.print(Json.stringify($classType.modify(method, id)));
                                    }
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
                                        Lib.print(Json.stringify($classType.search($e{searchable})));
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
                    };
                }
                else
                {
                    caseExpr = macro
                    {
                        if (routes[0] == $v{struct.restRootURL})
                        {
                            if (method != "GET")
                            {
                                if (routes.length == 1)
                                {
                                    Lib.print(Json.stringify($classType.modify(method)));
                                }
                                else if (routes.length == 2)
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
                    };
                }

                caseValues.push(caseExpr);
            }

            var routerBody = macro {
                var routes = page.split("/");

                if (routes.length > 0)
                {
                    $a{caseValues};
                }
            };

            var routerFunction:Function = {
                args: [{
                    name: "page",
                    type: macro :String
                },
                {
                    name: "method",
                    type: macro :String
                }],
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

                var meta = [];
                meta.push({
                    name: ":optional",
                    pos: Context.currentPos()
                });

                typeFields.push({
                    kind: FVar(type),
                    pos: Context.currentPos(),
                    name: f.identifier,
                    meta: meta
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
        var primaryField = "";

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

                if (f.isPrimary)
                {
                    primaryField = f.identifier;
                }

                typeFields.push({
                    kind: FVar(type),
                    pos: Context.currentPos(),
                    name: f.identifier,
                    access: [APublic],
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
                    var kind = typeFields[i].kind;
                    var type:ComplexType = null;

                    var e = {
                        expr: EField(macro this, mName),
                        pos: Context.currentPos()
                    };

                    switch (kind)
                    {
                        case FVar(_t):
                            var resolved = Context.resolveType(_t, Context.currentPos());
                            switch (resolved)
                            {
                                case TType(t,_):
                                    if (t.get().name == "SDateTime" || t.get().name == "SDate")
                                    {
                                        e = 
                                        {
                                            expr: ECall(
                                            {
                                                expr: EField(
                                                {
                                                    expr: EField(macro this, mName),
                                                    pos: Context.currentPos()
                                                }, "toString"),
                                                pos: Context.currentPos()
                                            }, []),
                                            pos: Context.currentPos()
                                        };
                                    }
                                default:
                            }
                        default:
                    }

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

            var metaData = new Array<MetadataEntry>();
            if (primaryField != "")
            {
                metaData.push({
                    name: ":id",
                    pos: Context.currentPos(),
                    params: [
                        macro $i{primaryField}
                    ]
                });
            }

            metaData.push({
                name: ":build",
                pos: Context.currentPos(),
                params: [
                    macro hxshare.Builder.finish($v{searchableFields})
                ]
            });
            
            var def:TypeDefinition = {
                fields: typeFields,
                kind: TDClass({
                    name: "Object",
                    pack: [ "sys", "db" ]
                }),
                name: struct.name,
                pack: [ "data" ],
                pos: Context.currentPos(),
                meta: metaData
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

    /**
    * Not to be used directly. This is auto-assigned to generated `sys.db.Object` classes to complete
    * generation of the class.
    **/
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
                    
                    if (item == null)
                    {
                        php.Web.setReturnCode(500);
                        php.Lib.print('The item with the id ' + id + ' does not exist.');
                        return null;
                    }

                    for (field in Reflect.fields(data))
                    {
                        Reflect.setField(item, field, Reflect.field(data, field));
                    }

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
                var searchBody = macro {
                    var items = manager.dynamicSearch(value);
                    var results = [];
                    for (item in items)
                        results.push(item.toTypedef());
                    return results;
                };

                var searchFunction:Function = {
                    args: [
                        {
                            name: "value",
                            type: macro :Dynamic
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