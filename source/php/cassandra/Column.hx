package php.cassandra;

@:native("Cassandra\\Column")
extern interface Column
{
    function name():String;
    function type():Type;
    function isReversed():Bool;
    function isStatic():Bool;
    function isFrozen():Bool;
    function indexName():String;
    function indexOptions():String;
}