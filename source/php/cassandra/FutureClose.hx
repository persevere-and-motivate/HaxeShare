package php.cassandra;

@:native("Cassandra\\FutureClose")
extern class FutureClose implements Future
{
    public function get(timeout:Dynamic):Dynamic;
}