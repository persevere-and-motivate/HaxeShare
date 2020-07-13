package php.cassandra.exception;

@:native("Cassandra\\Exception\\ValidationException")
extern class ValidationException extends RuntimeException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}