package php.mongodb.driver;

@:native("MongoDB\\Driver\\ReadConcern")
extern class ReadConcern
{

    public static final AVAILABLE:String;
    public static final LINEARIZABLE:String;
    public static final LOCAL:String;
    public static final MAJORITY:String;

    public function new(?level:String);
    public function bsonSerialize():Dynamic;
    public function getLevel():String;
    public function isDefault():Bool;
    public function serialize():String;
    public function unserialize(serialized:String):Void;

}