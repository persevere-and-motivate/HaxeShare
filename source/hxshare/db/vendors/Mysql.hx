package hxshare.db.vendors;

import hxshare.db.DBObject;

#if php
import php.db.Mysqli;
#end

class Mysql
{

    public static function connect(host:String, user:String, pass:String, database:String, ?port:Int, ?socket:String)
    {
        #if php
        
        #end
    }

}