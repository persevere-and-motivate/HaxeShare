package php.mongodb.driver;

import haxe.extern.EitherType;
import php.mongodb.bson.Int64;

@:native("MongoDB\\Driver\\WriteConcern")
extern class WriteConcern
{
    public static final MAJORITY:String;

    public function new(w:EitherType<String, Int>, ?wtimeout:Int, ?journal:Bool);
    public function bsonSerialize():Dynamic;
    public function getJournal():Null<Bool>;
    public function getW():Null<EitherType<String, Int>>;
    public function getWtimeout():EitherType<Int, Int64>;
    public function isDefault():Bool;
    public function serialize():String;
    public function unserialize(serialized:String):Void;
}