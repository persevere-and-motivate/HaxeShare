package php.cassandra.exception;

@:native("Cassandra\\Exception\\ProtocolException")
extern class ProtocolException extends RuntimeException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}