package php.mongodb;

extern class BSON
{

    @:native("MongoDB\\BSON\\fromJSON")
    public static function fromJSON(json:String):String;

    @:native("MongoDB\\BSON\\fromPHP")
    public static function fromPHP(value:Dynamic):String;

    @:native("MongoDB\\BSON\\toCanonicalExtendedJSON")
    public static function toCanonicalExtendedJSON(bson:String):String;

    @:native("MongoDB\\BSON\\toJSON")
    public static function toJSON(bson:String):String;

    @:native("MongoDB\\BSON\\toPHP")
    public static function toPHP(bson:String, ?typeMap:Array<Dynamic>):Dynamic;

    @:native("MongoDB\\BSON\\toRelaxedExtendedJSON")
    public static function toRelaxedExtendedJSON(bson:String):String;
    
}