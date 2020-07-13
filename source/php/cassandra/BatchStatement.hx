package php.cassandra;

@:native("Cassandra\\BatchStatement")
extern class BatchStatement implements Statement
{
    public function new(type:Int);
    public function add(statement:Dynamic, ?arguments:Dynamic):BatchStatement;
}