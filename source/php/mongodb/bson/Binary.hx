package php.mongodb.bson;

@:native("MongoDB\\BSON\\Binary")
extern class Binary
{

    public static final TYPE_GENERIC:Int;
    public static final TYPE_FUNCTION:Int;
    public static final TYPE_OLD_BINARY:Int;
    public static final TYPE_OLD_UUID:Int;
    public static final TYPE_UUID:Int;
    public static final TYPE_MD5:Int;
    public static final TYPE_ENCRYPTED:Int;
    public static final TYPE_USER_DEFINED:Int;

    public function new(data:String, type:Int);
    public function getData():String;
    public function getType():Int;
    public function jsonSerialize():Dynamic;
    public function serialize():String;
    public function __toString():String;
    public function unserialize(serialized:String):Void;

}