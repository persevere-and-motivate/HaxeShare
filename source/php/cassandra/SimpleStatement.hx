package php.cassandra;

@:native("Cassandra\\SimpleStatement")
extern class SimpleStatement implements Statement
{
    public function new(cql:String);
}