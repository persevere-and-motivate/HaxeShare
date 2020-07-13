package php.cassandra.type;

@:native("Cassandra\\Type\\Tuple")
extern class Tuple extends Type
{
    public function types():Dynamic;
    public function create(values:Dynamic):Tuple;
}