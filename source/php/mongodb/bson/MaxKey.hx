package php.mongodb.bson;

@:native("MongoDB\\BSON\\MaxKey")
extern class MaxKey
{

    public function new();
    public function jsonSerialize():Dynamic;
    public function serialize():String;
    public function unserialize(serialized:String):Void;
    
}