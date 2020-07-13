package php.cassandra.exception;

@:native("Cassandra\\Exception\\WriteTimeoutException")
extern class WriteTimeoutException extends ExecutionException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}