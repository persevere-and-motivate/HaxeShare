package php.cassandra;

@:native("Cassandra\\DefaultFunction")
extern class DefaultFunction implements Function
{
    public function name():String;
    public function simpleName():String;
    public function arguments():Dynamic;
    public function returnType():Type;
    public function signature():String;
    public function language():String;
    public function body():String;
    public function isCalledOnNullInput():Bool;
}