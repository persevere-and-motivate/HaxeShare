package hxshare.db;

class DBObject
{

    private var _fields:Map<Int, String>;

    public function getFields() return _fields;

    public function new()
    {
        _fields = new Map<Int, String>();
    }

    /**
    * Insert this database object into the currently connected database instance.
    **/
    public function insert()
    {
        Connection.instance.insert(this);
    }

    /**
    * Update this database object into the currently connected database instance.
    **/
    public function update()
    {
        Connection.instance.update(this);
    }

    /**
    * Delete this database object into the currently connected database instance.
    **/
    public function delete()
    {
        Connection.instance.delete(this);
    }

    /**
    * Retrieve all the items from the database relating to this object.
    **/
    public static function all()
    {
        var results = Connection.instance.select(new DBObject());
        return results;
    }

}