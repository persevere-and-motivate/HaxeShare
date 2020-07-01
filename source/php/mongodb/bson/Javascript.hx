package php.mongodb.bson;

@:native("MongoDB\\BSON\\Javascript")
extern class Javascript
{

    public function new(code:String, ?scope:Dynamic);
    public function getCode():String;
    public function getScope():Dynamic;
    public function jsonSerialize():Dynamic;
    public function serialize():String;
    public function __toString():String;
    public function unserialize(serialized:String):Void;

}