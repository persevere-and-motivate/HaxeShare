package php.mongodb.bson;

@:native("MongoDB\\BSON\\Regex")
extern class Regex
{

    public function new(pattern:String, ?flags:String);
    public function getFlags():String;
    public function getPattern():String;
    public function jsonSerialize():Dynamic;
    public function serialize():String;
    public function __toString():String;
    public function unserialize(serialized:String):Void;

}