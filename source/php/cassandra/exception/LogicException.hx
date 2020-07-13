package php.cassandra.exception;

@:native("Cassandra\\Exception\\LogicException")
extern class LogicException implements Exception
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
    public function __wakeup():Dynamic;
    public function __toString():Dynamic;
}