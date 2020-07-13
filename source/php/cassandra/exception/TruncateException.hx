package php.cassandra.exception;

@:native("Cassandra\\Exception\\TruncateException")
extern class TruncateException extends ExecutionException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}