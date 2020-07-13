package php.cassandra;

interface Schema
{
    function keyspace(name:String):Keyspace;
    function keyspaces():Dynamic;
}