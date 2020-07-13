package php.cassandra;

@:native("Cassandra\\Duration")
extern class Duration implements Value
{
    public function new(months:Dynamic, days:Dynamic, nanos:Dynamic);
    public function type():Type;
    public function months():String;
    public function days():String;
    public function nanos():String;
    public function __toString():String;
}