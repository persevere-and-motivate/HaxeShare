package hxshare.db;

interface IDatabase
{
    function connect(host:String, user:String, pass:String, database:String, ?port:Int, ?socket:String):Bool;
    function close():Void;
    function getDatabaseObject():Dynamic;
}