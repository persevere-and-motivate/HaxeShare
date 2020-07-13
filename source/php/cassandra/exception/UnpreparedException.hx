package php.cassandra.exception;

@:native("Cassandra\\Exception\\UnpreparedException")
extern class UnpreparedException extends ValidationException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}