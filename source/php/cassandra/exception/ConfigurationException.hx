package php.cassandra.exception;

@:native("Cassandra\\Exception\\ConfigurationException")
extern class ConfigurationException extends ValidationException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}