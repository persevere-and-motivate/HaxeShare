package hxshare.db;

typedef ConnectionInfo = {
    @:optional var host:String;
    @:optional var user:String;
    @:optional var pass:String;
    @:optional var port:Int;
    @:optional var socket:String;
}

@:autoBuild(hxshare.db.macros.Builder.build())
class DBObject
{

    public function new()
    {

    }

}