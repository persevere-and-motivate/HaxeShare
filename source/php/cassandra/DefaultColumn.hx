package php.cassandra;

@:native("Cassandra\\DefaultColumn")
extern class DefaultColumn implements Column
{
    public function name():String;
    public function type():Type;
    public function isReversed():Bool;
    public function isStatic():Bool;
    public function isFrozen():Bool;
    public function indexName():String;
    public function indexOptions():String;
}