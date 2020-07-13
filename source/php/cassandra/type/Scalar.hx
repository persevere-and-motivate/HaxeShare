package php.cassandra.type;

@:native("Cassandra\\Type\\Scalar")
extern class Scalar extends Type
{
    public function create(value:Dynamic):Dynamic;
}