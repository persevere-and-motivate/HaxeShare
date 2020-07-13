package php.cassandra;

@:native("Cassandra\\Function")
extern interface Function
{
    function name():String;
    function simpleName():String;
    function arguments():Dynamic;
    function returnType():Type;
    function signature():String;
    function language():String;
    function body():String;
    function isCalledOnNullInput():Bool;
}