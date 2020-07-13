package php.cassandra;

@:native("Cassandra\\Cluster")
extern interface Cluster
{
    function connect(keyspace:String):Session;
    function connectAsync(keyspace:String):Future;
}