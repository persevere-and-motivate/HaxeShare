package php.cassandra;

import haxe.extern.EitherType;

@:native("Cassandra\\Timestamp")
extern class Timestamp implements Value
{
    public function new(seconds:Int, microseconds:Int);
    public function type():Type;
    public function time():Int;
    public function microtime(get_as_float:Bool):EitherType<Float, String>;
    public function toDateTime():NativeDateTime;
    public function __toString():String;
}