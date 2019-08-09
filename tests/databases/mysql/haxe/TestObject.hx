package;

import hxshare.db.DBObject;

class TestObject extends DBObject
{

    @primary
    public var id:Int;
    
    public var name:String;

    public var description:String;

    public function new()
    {
        super();
    }

}