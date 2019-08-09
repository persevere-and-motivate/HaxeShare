package hxshare.db;

@:autoBuild(hxshare.db.macros.Builder.build())
class DBObject
{

    private var _idField:String;

    public function new()
    {
        _idField = "";
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
    * Retrieve all the data relating to the given database object.
    **/
    public static function all<T: DBObject>(object:T)
    {
        var results = Connection.instance.select(object);
        return results;
    }

    /**
    * Retrieve a single database object by id.
    *
    * @param id The ID to find.
    **/
    public static function get<T: DBObject>(object:T, id:Int)
    {
        var result = Connection.instance.select(object, [ object._idField => id ], null);
        if (result.length > 0)
            return result[0];
        return null;
    }

}