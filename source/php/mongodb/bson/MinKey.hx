package php.mongodb.bson;

@:native("MongoDB\\BSON\\MinKey")
extern class MinKey
{

    public function new();
    public function jsonSerialize():Dynamic;
    public function serialize():String;
    public function unserialize(serialized:String):Void;

}