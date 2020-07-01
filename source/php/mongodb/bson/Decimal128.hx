package php.mongodb.bson;

@:native("MongoDB\\BSON\\Decimal128")
extern class Decimal128
{

    public function new(?value:String);
    public function jsonSerialize():Dynamic;
    public function serialize():String;
    public function __toString():String;
    public function unserialize(serialized:String):Void;

}