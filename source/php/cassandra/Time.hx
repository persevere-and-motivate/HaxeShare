package php.cassandra;

import php.NativeDateTime;

@:native("Cassandra\\Time")
extern class Time implements Value
{
    public function new(nanoseconds:Dynamic);
    public function type():Type;
    public function seconds():Int;
    public function __toString():String;
    public static function fromDateTime(datetime:NativeDateTime):Time;
}