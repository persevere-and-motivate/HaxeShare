package;

import hxshare.db.DBObject;

class TestObject extends DBObject
{

    @primaryKey
    public var ID:UInt;
    public var Category:Int;
    public var Name:String;

    @dateFormat("DateTime")
    public var Posted:Date;
    public var Views:Float;

    public function new()
    {
        super();
    }

}