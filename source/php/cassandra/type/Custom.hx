package php.cassandra.type;

@:native("Cassandra\\Type\\Custom")
extern class Custom extends Type
{
    public function create(value:Dynamic):Dynamic;
}