package;

import hxshare.db.Vendor;
import hxshare.db.Connection;

import php.Lib;

class Main
{

    public static function main()
    {
        var dbConn = new Connection(VENDOR_MYSQL);
        dbConn.connect("localhost", "root", "", "test");
        
        var results = dbConn.select(new TestObject());
        for (res in results)
        {
            Lib.print("Item : " + res.id + "<br>");
        }
    }

}