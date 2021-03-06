# HaxeShare
HaxeShare is a continuation of the OWEL project - a work-in-progress web development framework with client- and server-side code generation utilities, a Router and form building functionality.

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

## Features
As this project is used in my own projects, it will be expanded to include new features.

The following items have been implemented:

 * Generation of client-side typedef structures representing simple data structures.
 * Generation of server-side classes extending `sys.db.Object` from the `record-macros` library with typical additional functionality.
 * Generation of a server-side REST API using generated classes handling specific URLs.
 * Generation of custom REST components.
 * A standard platform-independent `Router`.
 * A `FormBuilder` with the ability to submit data forms easily.
 * Added OAuth on the PHP target (just externs for now. Currently untested).

Essential Features to be added:

 * Allow static form submissions using a typical `<form>` element.
 * Expand the FormBuilder to also include the ability to generate forms using many procedures.
 * Add `Security` to allow/deny access to particular pieces of data.

Beneficial features:

 * Add server-to-client debugging for more effective tracking of issues.
 * Add auto-generation of Login forms with Session tracking for both AJAX (client) and server.
 * Add externs for the popular payment gateways (PayPal, Stripe and Square).

See the [Roadmap](/Roadmap.md) for more details.

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
        Builder.addField("shorttext", "Title");
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
| text      | String      | sys.db.Types.SSmallText|
| longtext  | String      | sys.db.Types.SText     |
| bool      | Bool        | sys.db.Types.SBool     |
| int       | Int         | sys.db.Types.SInt      |
| float     | Float       | sys.db.Types.SFloat    |
| date      | Date        | sys.db.Types.SDate     |
| time      | Date        | sys.db.Types.STimeStamp|
| datetime  | Date        | sys.db.Types.SDateTime |

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
The `Router` class has been changed to suit a more appropriate switch/if pattern style for performance reasons. This approach is also simpler and easier to read.

This new `Router` includes very simple functionality for both the client and server and is now completely platform independent.

### REST-based Server Router
The REST-based server router generates code using basic RESTful notation. It detects the HTTP Method, checks the url passed into the `page` parameter (as used in the `Request` class) and then uses generated database objects to retrieve or `modify()` data.

The REST router generates matches for the following URL's:

```
  GET :table:/all
     - Calls the generated all() function to retrieve all the objects (without limit) in the database.

  GET :table:/search
     - Calls the generated search() function to search against an object in POST data. This means when using this parameter, you must give the server an object that will be used as the searching component. Uses the `dynamicSearch` function of `sys.db.Object`.

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
        Builder.addField("shorttext", "Title");
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

### Custom REST components

You can now add custom REST components which allows you to specify a URL that can do more complicated tasks on the server versus the standard generated code as above.

You can do this by calling the function `Builder.customRestComponent()` which takes the following parameters:

```
    `extension` - This is the second matching component of the URL you want to match.
    `e` - This is the macro expression that will be output to the matching component.
```

Take the following example:

```
Builder.addRestRoute("roadmap");
Builder.customRestComponent("children", 
macro 
{
    var results = FV_RoadmapItem.manager.search($i{"$ParentID"} > -1);
    var objects = [];
    for (result in results)
    {
        objects.push(result.toTypedef());
    }
    Lib.print(Json.stringify(objects));
    return;
});
```

Here, when calling `roadmap/children` from the client, the following macro expression will be called. This is called regardless of HTTP Method, unless you choose to check this.

Note the following variables in this context are available to you:

 * `method` - This is the HTTP Method obtained from the server.
 * `routes` - This is an array of URL components split from the original URL given to us from the client. In the case above, that would be [`roadmap`, `children`]. You can use this in the above macro context if you want to add more functionality.

Note too that if you don't call `return;` at the end of the expression, the rest of the function `router` will still be called, which may lead to unwanted results.

## Form Builder
A `FormBuilder` class has now been added which allows for easier submission of form data to the server. It currently only supports AJAX requests and requires the use of ID values for picking up elements and their values.

Typically, one creates a `FormBuilder` after a HTML page has been received and rendered on-screen. For example,

```haxe
Request.getPage("pages/login.htm", function(success, content)
{
    if (success)
    {
         var builder = new FormBuilder<TLoginData>();
        // Do some extra things
    }
});
```

To begin, we need to call `beginDynamic`, like so:

```haxe
builder.beginDynamic("#submit", "login");
```

It is called `beginDynamic` as it is designed for the purposes of a dynamically-loading page rather than pages directly served by the server.

The first parameter is the `id` value of the submit button used to submit the data to the server. The data should be that matching the type we gave at construction as it is a template class.

The second parameter is the defined structure at compile-time. For example, "login" would refer to a database object as seen in the section above, with the call `Builder.addRestRoute`.

Next, we can start defining which elements match which fields in our data:

```haxe
builder.fieldSync("title");
builder.fieldSync("description");
```

The `fieldSync` call takes a single identifier, which matches the `id` value of an element and handles the change event to update the respective field in the `data` field. If the data has already been filled, either by passing a `data` object to the constructor or by passing `true` in the fourth optional parameter of `beginDynamic`, the elements will be set with any values that already exist within that instance.

At each stage of the submission, we can verify validation and handle anything after we submit or request a deletion using callback functions.

The `onValidate` function is useful for validating data before submitting the data to the server.

```haxe
builder.onValidate = function(data)
{
    if (data.title == "")
    {
        trace("`title` must have a value.");
        return false;
    }

    return true;
};
```

We can do anything with our data at this point, as well as change any existing data. By returning `true`, we tell the builder to submit the data. Returning `false` will stop submission.

There are also `onSubmit` and `onDelete` functions which do not take any arguments and does not return anything, but can be useful if you wish to do anything with UI after any one of these are called, like for example removing an element when `onDelete` is called.

## Using the Request Class
The `Request` class is a simple interface that allows you to retrieve or modify data primarily from the server. When using this class, it is assumed that the `page` parameter on the server is handled correctly. You can retrieve this on the server-side in Haxe using `php.Web.getParams().get("page")`.

With this out of the way, the following functions are available:

```
    Request.getPage() - On the client, retrieves a page via AJAX, or on the server, simply checks if the page exists and returns the contents, or otherwise sets a 404 status code.

    Request.get() - Retrieve data from the server.

    Request.post() - POST data to the server.

    Request.put() - PUT data to the server.

    Request.delete() - DELETE data from the server.

    Request.templatise() - A convenience function which replaces % field notation in the contents of the request, with the values of the fields in a given object. Fields inside of the first parameter `into` must wrap the `%` symbol around them for this function to work as expected.

    This function also handles HTML templates for arrays.
```

More detailed documentation can be found [in the class](https://github.com/persevere-and-motivate/HaxeShare/blob/master/source/hxshare/Request.hx).

## License
We use the MIT License.

If you use HaxeShare in any of your projects, we strongly appreciate accreditation but this is voluntary.