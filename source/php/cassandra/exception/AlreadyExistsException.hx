package php.cassandra.exception;

@:native("Cassandra\\Exception\\AlreadyExistsException")
extern class AlreadyExistsException extends ConfigurationException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}