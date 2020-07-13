package php.cassandra.exception;

@:native("Cassandra\\Exception\\InvalidArgumentException")
extern class InvalidArgumentException implements Exception
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
    public function __wakeup():Dynamic;
    public function __toString():Dynamic;
}