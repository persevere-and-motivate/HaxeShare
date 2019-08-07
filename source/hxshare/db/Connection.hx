package hxshare.db;

/**
The `Connection` class is a wrapper for various vendors and provides broad access
to each of the underlying databases.
**/
class Connection
{

    private var _vendor:Vendor;

    /**
    * Creates a new Connection object.
    *
    * @param vendor This is the vendor database you wish to use, such as MySQL or SQLLite.
    **/
    public function new(vendor:Vendor)
    {
        _vendor = vendor;
    }

    /**
    * Connects to the database using the following queries.
    **/
    public function connect(host:String, user:String, pass:String, ?port:Int, ?database:String, ?socket:Dynamic)
    {
        // @NotImplemented
    }

    /**
    * Retrieves a series of rows from the database.
    **/
    public function select(table:String, filter:Dynamic, options:Dynamic)
    {
        // @NotImplemented
    }

    /**
    * Insert data to a specific table in the database.
    **/
    public function insert(table:String, data:Dynamic)
    {
        // @NotImplemented
    }

    /**
    * Update data to a specific table in the database with the given options.
    **/
    public function update(table:String, data:Dynamic, options:Dynamic)
    {
        // @NotImplemented
    }

    /**
    * Deletes from the specific table in the database with the given options.
    **/
    public function delete(table:String, options:Dynamic)
    {
        // @NotImplemented
    }

    /**
    * Calls the named procedure as found in the subject database.
    **/
    public function callProcedure(procedure:String)
    {
        // @NotImplemented
    }

}