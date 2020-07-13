package php.cassandra;

@:native("Cassandra\\Future")
extern interface Future
{
    function get(timeout:Dynamic):Dynamic;
}