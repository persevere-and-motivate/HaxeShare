package php.cassandra.exception;

@:native("Cassandra\\Exception\\TimeoutException")
extern class TimeoutException extends RuntimeException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}