package php.cassandra;

@:native("Cassandra\\FutureRows")
extern class FutureRows implements Future
{
    public function get(timeout:Dynamic):Dynamic;
}