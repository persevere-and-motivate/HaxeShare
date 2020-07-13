package php.cassandra.retrypolicy;

@:native("Cassandra\\RetryPolicy\\Logging")
extern class Logging implements RetryPolicy
{
    public function new(childPolicy:RetryPolicy);
}