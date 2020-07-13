package php.cassandra.type;

@:native("Cassandra\\Type\\Map")
extern class Map extends Type
{
    public function keyType():Type;
    public function valueType():Type;
    public function create(value:Dynamic):Map;
}