package php.cassandra;

@:native("Cassandra\\Timeuuid")
extern class Timeuuid implements Value implements UuidInterface
{
    public function new(timestamp:Int);
    public function __toString():String;
    public function type():Type;
    public function uuid():String;
    public function version():Int;
    public function time():Int;
    public function toDateTime():NativeDateTime;
}