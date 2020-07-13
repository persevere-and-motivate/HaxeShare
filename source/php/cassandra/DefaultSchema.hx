package php.cassandra;

@:native("Cassandra\\DefaultSchema")
extern class DefaultSchema implements Schema
{
    public function keyspace(name:String):Keyspace;
    public function keyspaces():Dynamic;
    public function version():Int;
}