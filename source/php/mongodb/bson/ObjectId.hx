package php.mongodb.bson;

@:native("MongoDB\\BSON\\ObjectId")
extern class ObjectId
{
    
    public function new(?id:String);
    public function getTimestamp():Int;
    public function jsonSerialize():Dynamic;
    public function serialize():String;
    public function __toString():String;
    public function unserialize(serialized:String):Void;

}