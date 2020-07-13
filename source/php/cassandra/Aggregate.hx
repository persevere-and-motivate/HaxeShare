package php.cassandra;

@:native("Cassandra\\Aggregate")
extern interface Aggregate
{
    function name():String;
    function simpleName():String;
    function argumentTypes():Dynamic;
    function finalFunction():Function;
    function stateFunction():Function;
    function initialCondition():Value;
    function returnType():Type;
    function stateType():Type;
    function signature():String;
}