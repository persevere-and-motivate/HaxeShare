package php.cassandra;

@:native("Cassandra\\DefaultAggregate")
extern class DefaultAggregate implements Aggregate
{
    public function name():String;
    public function simpleName():String;
    public function argumentTypes():Dynamic;
    public function finalFunction():Function;
    public function stateFunction():Function;
    public function initialCondition():Value;
    public function returnType():Type;
    public function stateType():Type;
    public function signature():String;
}