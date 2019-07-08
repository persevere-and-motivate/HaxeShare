package hxshare;

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
    * If using PUT, POST or GET for a complex search, the data to send to the server.
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