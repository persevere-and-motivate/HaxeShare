package php.mongodb.bson;

@:native("MongoDB\\BSON\\Timestamp")
extern class Timestamp implements TimestampInterface
{
    public function new(increment:Int, timestamp:Int);
    public function getIncrement():Int;
    public function getTimestamp():Int;
    public function jsonSerialize():Dynamic;
    public function serialize():String;
    public function __toString():String;
    public function unserialize(serialized:String):Void;
}