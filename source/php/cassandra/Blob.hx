package php.cassandra;

@:native("Cassandra\\Blob")
extern class Blob implements Value
{
    public function new(bytes:String);
    public function __toString():String;
    public function type():Type;
    public function bytes():String;
    public function toBinaryString():String;
}