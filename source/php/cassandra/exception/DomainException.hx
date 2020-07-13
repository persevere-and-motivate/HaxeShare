package php.cassandra.exception;

@:native("Cassandra\\Exception\\DomainException")
extern class DomainException implements Exception
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
    public function __wakeup():Dynamic;
    public function __toString():Dynamic;
}