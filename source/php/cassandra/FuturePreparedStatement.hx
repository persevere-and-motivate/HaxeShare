package php.cassandra;

@:native("Cassandra\\FuturePreparedStatement")
extern class FuturePreparedStatement implements Future
{
    public function get(timeout:Dynamic):Dynamic;
}