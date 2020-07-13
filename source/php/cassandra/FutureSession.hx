package php.cassandra;

@:native("Cassandra\\FutureSession")
extern class FutureSession implements Future
{
    public function get(timeout:Dynamic):Dynamic;
}