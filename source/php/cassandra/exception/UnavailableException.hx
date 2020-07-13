package php.cassandra.exception;

@:native("Cassandra\\Exception\\UnavailableException")
extern class UnavailableException extends ExecutionException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}