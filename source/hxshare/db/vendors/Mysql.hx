package hxshare.db.vendors;

#if php
import php.db.Mysqli;
#end

class Mysql implements IDatabase
{

    #if php
    var db:Mysqli;
    #end

    public function new()
    {

    }

    public function connect(host:String, user:String, pass:String, database:String, ?port:Int, ?socket:String):Bool
    {
        #if php
        db = new Mysqli();
        return db.real_connect(host, user, pass, database, port, socket);
        #else
        return false;
        #end
    }

    public function getDatabaseObject()
    {
        #if php
        return db;
        #else
        return null;
        #end
    }

    public function close()
    {
        #if php
        db.close();
        #end
    }

}