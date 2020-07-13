package php.cassandra.exception;

@:native("Cassandra\\Exception\\ServerException")
extern class ServerException extends RuntimeException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}