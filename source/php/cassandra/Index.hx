package php.cassandra;

@:native("Cassandra\\Index")
extern interface Index
{
    function name():String;
    function kind():String;
    function target():String;
    function option(name:String):Value;
    function options():Dynamic;
    function className():String;
    function isCustom():Bool;
}