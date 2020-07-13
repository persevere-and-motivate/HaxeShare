package php.cassandra.exception;

@:native("Cassandra\\Exception\\OverloadedException")
extern class OverloadedException extends ServerException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}