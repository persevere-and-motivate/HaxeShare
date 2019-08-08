package hxshare.db;

class DBObject
{

    public function new()
    {

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
    public static function all(object:DBObject)
    {
        var tName = Type.getClassName(object);
        tName = tName.substr(tName.lastIndexOf(".") + 1);
        var results = Connection.instance.select(tName);
        
    }

}