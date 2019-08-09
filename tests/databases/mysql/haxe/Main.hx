package;

import hxshare.db.Vendor;
import hxshare.db.Connection;
import hxshare.db.DBObject;

import php.Lib;

class Main
{

    public static function main()
    {
        var dbConn = new Connection(VENDOR_MYSQL);
        dbConn.connect("localhost", "root", "", "test");
        
        var result = DBObject.get(new TestObject(), 5);
        Lib.print("Item : " + result.id + "<br>");
    }

}