package php.cassandra;

@:native("Cassandra\\FutureValue")
extern class FutureValue implements Future
{
    public function get(timeout:Dynamic):Dynamic;
}