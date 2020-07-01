package php.mongodb.driver;

import haxe.extern.EitherType;

@:native("MongoDB\\Driver\\ReadPreference")
extern class ReadPreference
{
    
    public static final RP_PRIMARY:Int;
    public static final RP_PRIMARY_PREFERRED:Int;
    public static final RP_SECONDARY:Int;
    public static final RP_SECONDARY_PREFERRED:Int;
    public static final RP_NEAREST:Int;
    public static final PRIMARY:String;
    public static final PRIMARY_PREFERRED:String;
    public static final SECONDARY:String;
    public static final SECONDARY_PREFERRED:String;
    public static final NEAREST:String;
    public static final NO_MAX_STALENESS:Int;
    public static final SMALLEST_MAX_STALENESS_SECONDS:Int;

    public function new(mode:EitherType<String, Int>, ?tagSets:Dynamic, ?options:Dynamic);
    public function bsonSerialize():Dynamic;
    public function getHedge():Dynamic;
    public function getMaxStalenessSeconds():Int;
    public function getMode():Int;
    public function getModeString():String;
    public function getTagSets():Dynamic;
    public function serialize():String;
    public function unserialize(serialized:String):Void;

}