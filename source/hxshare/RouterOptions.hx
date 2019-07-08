package hxshare;

typedef RouterOptions =
{
    /**
    * A value specifying if the router should be client-based (using JavaScript hashing)
    * or server-based (a typical server-side router). If server, make sure you have a .htaccess
    * file in your root. If one does not exist, the macro context will generate one for you.
    **/
    var clientOrServer:Int;
    /**
    * If you enable a REST API, the Builder will generate a REST-based router than a router
    * that only retrieves page resources.
    **/
    @:optional var enableREST:Bool;
}