# HaxeShare
Originally known as OWEL, HaxeShare is a continuation of the OWEL project using Haxe directly without any scripting language jargon. This new project is designed just like OWEL, to simplify the process of building websites, web, REST and client/server applications.

HaxeShare is considered in development, however all the features that exist have been tested on both the client and server in their respective environments.

Targets tested:

 * JavaScript (client)
 * PHP (server)

Targets not tested:

 * JavaScript (server/NodeJS)
 * Neko (server)
 * Python (server)
 * Java (server)
 * C# (server)

The `record-macros` dependency only supports MySQL and SQLLite for now. We may develop or contribute to this library in the future to add support for other SQL and NoSQL targets.

If you happen to be testing for any one of the above targets, please let us know in the Issues for tracking.

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

## Router

### General Router
There is now a `Router` class which you can use to define URLs and their respective tasks. It is in early stages and is not recommended to be used in production software yet. However, you may test it out on a development server.

The `Router` class currently has the following features:

 * JavaScript hash-based router.
 * Retrieves HTML pages from the server.
 * Retrieves data from the server using the REST API (see the REST-based Server Router below on how to implement).

Features yet to be added:

 * Server-based router.
 * Parameterised URLs.
 * More complex search request capabilities

To use the router, create a `Router` class.
You can start adding route URLs and the options for them using the `addRoute` function.

A basic client-side example:

```haxe
var router = new Router();
router.addRoute("/", { page: "index.htm", selector: "#content" });
```

This will create a route using a single "/" specifying the home page. This will request the page `index.htm` and display the results inside the HTML element with the id `content`.

Let's add another:

```haxe
router.addRoute("/about/", { page: "about.htm", selector: "#inner-content", dependsOn: 0 });
```

Here, we say we are depending on index `0`, which is the first route we added. `addRoute()` returns an index value for that route, which means we can refer to it later for this very purpose.

What happens here is that before the `about` page is displayed, everything related to the home page will execute, then the `about` route will be executed.

Let's get more sophisticated:

```haxe
router.addRoute("/products/", { page: "products.htm", selector: "#inner-content", dependsOn: 0,
    withRequest: [
        {
            restURL: "product/all",
            method: "GET",
            eachTemplate: "<li>%title%</li>",
            replace: "%products%"
        }
    ]
});
```

We now start using `withRequest`, which is an optional array parameter that takes up to five extra parameters:

```haxe
typedef RouteRequest = 
{
    /**
    * The RESTful url value to use for the request.
    **/
    var restURL:String;
    /**
    * The HTTP Method to use for the request.
    **/
    var method:String;
    /**
    * If using PUT, POST, or GET for a complex search, the data to send to the server.
    **/
    @:optional var data:Dynamic;
    /**
    * The HTML template value to use if the expected result of the request is an array.
    **/
    @:optional var eachTemplate:String;
    /**
    * Just as in `Request.templatise()`, this is the unique value in the body HTML to replace
    * with the parsed template results before rendering.
    **/
    @:optional var replace:String;
}
```

Taking the above example, the following will happen:

 1. We obtain the contents of `products.htm`.
 2. We then initiate a resource request to the server using the URL `product/all` with the HTTP Method `GET`. Following the information in the section titled "REST-based Server Router", we obtain *all* the available products without limits.
 3. Then, in *each* value we retrieve, we parse the value `eachTemplate` and replace `%title%` with the actual title string of the product we get.
 4. Finally, inside the contents of `products.htm` should be a value identified as `%products%` - replace it with the parsed results.

On the client-side, this is done using AJAX while on the server it uses server resources to complete this task (however, the server functionality in the Router is not yet available).

Also be warned that only one item in `withRequest` is accepted. This may be changed into an actual object as making multiple AJAX requests on a single page load is potentially slow. When complex searching becomes available, it is likely this will become the case. More examples involving complex searching will also be available at the relevant times.

Make sure as you finish up with your router to `execute()` like so:

```haxe
router.execute();
```

### REST-based Server Router
The REST-based server router generates code using basic RESTful notation. It detects the HTTP Method, checks the url passed into the `page` parameter (as used in the `Request` class) and then uses generated database objects to retrieve or `modify()` data.

The REST router generates matches for the following URL's:

```
  GET :table:/all
     - Calls the generated all() function to retrieve all the objects (without limit) in the database.

  GET :table:/search/:query:
     - Calls the generated search() function to search using the :query: value. Currently limited to string values.

  GET :table:/:id:
     - Calls the generated modify() function to retrieve an object within the given id.

  PUT, POST, DELETE :table:/:id:
     - Calls the generated modify() function and modifies an object within the given id respectively.
     
```

To setup and generate a server router, we need to do some extra configuration at initialisation macro context:

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
        Builder.addRestRoute("department");

        Builder.build();
    }

}

#end
```

What has changed in the above code is the addition of a new line: `Builder.addRestRoute("department");`. This defines the `table` or the "root" value to use as the first parameter in the URL when requesting this particular resource. The notation for the API follows as above.

An example of this in practice on the client-side can be seen below:

```haxe
Request.get("department/all", function(content, success)
{
    if (success)
    {
        // do something with the `content` from the server.
    }
});
```

Make sure in your server `Main` you place `@:build` like so:

```haxe
@:build(hxshare.Builder.generateServerREST())
class Main
...
```

## Roadmap
As this project is used in my own projects, it will be expanded to include new features. A router will most likely be the next feature to be implemented, although at first it will be rather restrictive.

For the router, the following processes will be added:

 * Generate a hash-based router for the client-side when using JavaScript. - DONE
 * Generate a web-based URL router for the server-side when using a server language like PHP.
 * Generate a REST-based router for the server-side using GET, POST, PUT and DELETE methods using standard URL notation. - DONE

In addition, a `FormBuilder` of sorts will also be added to the codebase to simplify form processes for editing data on your website - again, by using customisable templates.

## License
We use the MIT License.

If you use HaxeShare in any of your projects, we strongly appreciate accreditation but this is voluntary.