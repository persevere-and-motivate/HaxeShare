package php.cassandra.type;

@:native("Cassandra\\Type\\Set")
extern class Set extends Type
{
    public function valueType():Type;
    public function create(value:Dynamic):Set;
}