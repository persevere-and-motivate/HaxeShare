package php.mongodb.driver;

@:native("MongoDB\\Driver\\CursorId")
extern class CursorId
{
    
    public function new();
    public function serialize():String;
    public function __toString():String;
    public function unserialize(serialized:String):Void;

}