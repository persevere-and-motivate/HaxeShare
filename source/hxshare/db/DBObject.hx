package hxshare.db;

import haxe.rtti.Meta;

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

    private var _current:Bool;
    private var _id:Int;
    private static var _primaryDatabase:String;
    private static var _connectionInfo:ConnectionInfo;

    public static function initialise(connectionInfo:ConnectionInfo, primaryDatabase:String, vendor:Vendor = VENDOR_MYSQL)
    {
        _connectionInfo = connectionInfo;
        _primaryDatabase = primaryDatabase;
    }

    public function getID()
    {
        return _id;
    }

    static var _error:String;
    public static var Error(get, set):String;
    static function get_Error() return _error;
    static function set_Error(val) return _error = val;

    public function new()
    {

    }

    

}