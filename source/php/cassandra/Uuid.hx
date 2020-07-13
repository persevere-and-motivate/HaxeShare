package php.cassandra;

@:native("Cassandra\\Uuid")
extern class Uuid implements Value implements UuidInterface
{
    public function new(uuid:String);
    public function __toString():String;
    public function type():Type;
    public function uuid():String;
    public function version():Int;
}