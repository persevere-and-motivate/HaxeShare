package php.cassandra.type;

@:native("Cassandra\\Type\\Collection")
extern class Collection extends Type
{
    public function valueType():Type;
    public function create(type:Dynamic):Collection;
}