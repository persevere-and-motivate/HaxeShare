package php.cassandra;

@:native("Cassandra\\Inet")
extern class Inet implements Value
{
    public function new(address:String);
    public function __toString():String;
    public function type():Type;
    public function address():String;
}