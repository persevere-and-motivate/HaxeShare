package php.mongodb.bson;


@:native("MongoDB\\BSON\\UTCDateTime")
extern class UTCDateTime
{

    public function new(?milliseconds:Any);
    public function toDateTime():Date;
    public function jsonSerialize():Dynamic;
    public function serialize():String;
    public function __toString():String;
    public function unserialize(serialized:String):Void;

}