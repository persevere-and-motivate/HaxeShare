# HaxeShare
Originally known as OWEL, HaxeShare is a continuation of the OWEL project using Haxe directly without any scripting language jargon. This new project is designed just like OWEL, to simplify the process of building websites, web, REST and client/server applications.

## Installation
Currently, you can clone this project and setup a haxelib `dev` environment like so:

```
haxelib dev hxshare ./
```

Where the `./` assumes you are in the root of the HaxeShare project. Alternatively, you can install with haxelib:

```
haxelib git hxshare https://github.com/persevere-and-motivate/HaxeShare.git
```

This library depends on [record-macros](https://github.com/HaxeFoundation/record-macros) from the Haxe Foundation for server-side code generation.

## Usage
To get started with HaxeShare, include it into your `*.hxml` file with `-lib record-macros`.

In a new class, we need to create an initialisation macro that allows us to define our structures.

```haxe
package;
#if macro

import hxshare.Builder;

class Generator
{

    public static function build()
    {
        Builder.init();

        Builder.beginStructure("PM_Department");
        Builder.addField("id", "ID");
        Builder.addField("shorttext", "URL");
        Builder.addField("shorttext", "Title", true);
        Builder.addField("longtext", "Description");

        Builder.build();
    }

}

#end
```

Let's look at what is happening above.

1. We wrap our class in `macro` context and `import hxshare.Builder`.
2. Inside our class, we define a function that is to be called at the initialisation stage.
3. `Builder.init()` initialises all the local variables within `Builder` and defines some basic types.
4. `Builder.beginStructure` is a function we use to define a new structure that represents the name of our database table.
5. `Builder.addField` takes two arguments. The first is the type of the field. Each type represents a client-side and server-side type. In the first example, `id` represents an `Int` on the client-side and `sys.db.Types.SId` on the server-side. The next argument is the name of the field itself. This is case-sensitive, so make sure this matches in the database table as well. The third, but optional, argument determines if that field should be searchable. This would generate a `search` function on the server class allowing the ability to search based on these fields.
6. Finally, we call `Builder.build()` to build and define our types.

In our `*.hxml` file, we need to add another line:

```
--macro Generator.build()
```

This will make sure all our types are defined in both client- and server- contexts.

Currently, the `Builder.build()` call determines if you are on the server based on target language. Only PHP is included, however there may be an option in the future to set either client or server for this call.

## Default Structure Types
As mentioned above, you can specify a type in the `Builder.addField()` function call in the first argument. See below the current default types within the Builder:

| Type      | Client Type | Server Type            |
|----------:|:-----------:|:-----------------------|
| id        | Int         | sys.db.Types.SId       |
| shorttext | String      | sys.db.Types.STinyText |
| longtext  | String      | sys.db.Types.SText     |
| bool      | Bool        | sys.db.Types.SBool     |
| int       | Int         | sys.db.Types.SInt      |
| float     | Float       | sys.db.Types.SFloat    |

You can add your own custom types using the `Builder.addType()` function call.

```
public static function addType(identifier:String, clientType:ComplexType, serverType:ComplexType)

 > identifier is the name of the type we wish to define.
 > clientType is the type of the field to resolve to on the client-side.
 > serverType is the type of the field to resolve to on the server-side.

 e.g. addType("id", macro :Int, macro :sys.db.Types.SId)

```

## Roadmap
As this project is used in my own projects, it will be expanded to include new features. A router will most likely be the next feature to be implemented, although at first it will be rather restrictive.

For the router, the following processes will be added:

 * Generate a hash-based router for the client-side when using JavaScript.
 * Generate a web-based URL router for the server-side when using a server language like PHP.
 * Generate a REST-based router for the server-side using GET, POST, PUT and DELETE methods using standard URL notation.

## License
We use the MIT License.

If you use HaxeShare in any of your projects, we strongly appreciate accreditation but this is voluntary.