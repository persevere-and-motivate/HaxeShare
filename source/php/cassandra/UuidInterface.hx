package php.cassandra;

@:native("Cassandra\\UuidInterface")
extern interface UuidInterface
{
    function uuid():String;
    function version():Int;
}