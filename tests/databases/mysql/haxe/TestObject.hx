package;

import hxshare.db.DBObject;

@:build(hxshare.db.macros.Builder.build())
class TestObject extends DBObject
{

    public var id:Int;
    
    public var name:String;

    public var description:String;

    public function new()
    {
        super();
    }

}