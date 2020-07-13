package php.cassandra.exception;

@:native("Cassandra\\Exception\\DivideByZeroException")
extern class DivideByZeroException extends RangeException
{
    public function new(message:Dynamic, code:Dynamic, previous:Dynamic);
}