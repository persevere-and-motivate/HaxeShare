package hxshare;

import haxe.Constraints;

typedef Route = 
{
    /**
    * The page to retrieve from the server with this request.
    **/
    var page:String;
    /**
    * The selector to use to place the page results (using JQuery).
    **/
    var selector:String;
    /**
    * After retrieving page contents, execute the following requests before display.
    **/
    @:optional var withRequest:Array<RouteRequest>;
    /**
    * The additional procedure to call when this route is matched.
    **/
    @:optional var proc:Function;
    /**
    * If greater than -1 or not null, this will execute the route this route depends on first
    * before executing this.
    **/
    @:optional var dependsOn:Int;
}