package hxshare.db;

import hxshare.db.DBObject;
import hxshare.db.vendors.*;

/**
The `Connection` class is a wrapper for various vendors and provides broad access
to each of the underlying databases.
**/
class Connection
{

    private var _vendor:Vendor;
    private var _database:IDatabase;

    static var _instance:Connection;
    public static var instance(get, never):Connection;
    static function get_instance()
    {
        return _instance;
    }

    /**
    * Creates a new Connection object.
    *
    * @param vendor This is the vendor database you wish to use, such as MySQL or SQLLite.
    **/
    public function new(vendor:Vendor)
    {
        _vendor = vendor;
        _instance = this;

        if (vendor == VENDOR_MYSQL)
        {
            _database = new Mysql();
        }
    }

    /**
    * Connects to the database using the following parameters.
    **/
    public function connect(host:String, user:String, pass:String, database:String, ?port:Int, ?socket:String)
    {
        switch (_vendor)
        {
            case VENDOR_MYSQL:
                var _db = "";
                if (database != null)
                    _db = database;
                
                var _port = 3306;
                if (port != null)
                    _port = port;
                
                var _socket = "";
                if (socket != null)
                    _socket = socket;
                
                return _database.connect(host, user, pass, _db, _port, _socket);
            default:

        }

        return false;
    }

    /**
    * Creates a database within this Connection.
    *
    * @param dbName The name of the database.
    **/
    public function createDatabase(dbName:String)
    {
        // @NotImplemented
    }

    /**
    * Retrieves a series of rows from the database.
    **/
    public function select<T>(object:T, ?filter:Map<String, Dynamic>, ?options:Dynamic):Array<T>
    {
        // @NotImplemented
        return null;
    }

    /**
    * Insert data to a specific table in the database.
    **/
    public function insert(object:DBObject)
    {
        // @NotImplemented
    }

    /**
    * Update data to a specific table in the database with the given options.
    **/
    public function update(object:DBObject)
    {
        // @NotImplemented
    }

    /**
    * Deletes from the specific table in the database with the given options.
    **/
    public function delete(object:DBObject)
    {
        // @NotImplemented
    }

    /**
    * Calls the named procedure as found in the subject database.
    **/
    public function callProcedure(procedure:String, args:Array<Dynamic>)
    {
        // @NotImplemented
    }

    /**
    * Closes the connection to the database.
    **/
    public function close()
    {
        _database.close();
    }

}