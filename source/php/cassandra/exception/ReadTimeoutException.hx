package php.cassandra.exception;

@:native("Cassandra\\Exception\\ReadTimeoutException")
extern class ReadTimeoutException extends ExecutionException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}