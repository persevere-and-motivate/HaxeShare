package php.cassandra.exception;

@:native("Cassandra\\Exception\\UnauthorizedException")
extern class UnauthorizedException extends ValidationException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}