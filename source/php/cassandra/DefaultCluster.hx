package php.cassandra;

@:native("Cassandra\\DefaultCluster")
extern class DefaultCluster implements Cluster
{
    public function connect(?keyspace:String, ?timeout:Int):Session;
    public function connectAsync(?keyspace:String):Future;
}