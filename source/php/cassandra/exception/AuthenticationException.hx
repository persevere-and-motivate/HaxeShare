package php.cassandra.exception;

@:native("Cassandra\\Exception\\AuthenticationException")
extern class AuthenticationException extends RuntimeException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}