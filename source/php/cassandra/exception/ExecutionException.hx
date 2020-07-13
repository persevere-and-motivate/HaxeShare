package php.cassandra.exception;

@:native("Cassandra\\Exception\\ExecutionException")
extern class ExecutionException extends RuntimeException implements Exception
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}