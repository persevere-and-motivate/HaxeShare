package;

import hxshare.db.Connection;
import hxshare.db.Vendor;

import php.Lib;

class Main
{

    public static function main()
    {
        new Connection(VENDOR_MYSQL);

        var connection = Connection.instance;

        if (connection.connect("localhost", "root", "", "test"))
        {
            Lib.print("Connected to the server.<br>");
            
            
            connection.close();
            Lib.print("Closed the connection to the server.");
        }

    }

}