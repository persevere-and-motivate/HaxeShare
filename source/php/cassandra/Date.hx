package php.cassandra;

import php.NativeDateTime;

@:native("Cassandra\\Date")
extern class Date implements Value
{
    public function new(seconds:Int);
    public function type():Type;
    public function seconds():Int;
    public function toDateTime(time:Time):NativeDateTime;
    public function __toString():String;

    public static function fromDateTime(datetime:NativeDateTime):NativeDateTime;
}