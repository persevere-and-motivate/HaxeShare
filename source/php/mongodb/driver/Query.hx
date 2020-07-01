package php.mongodb.driver;

@:native("MongoDB\\Driver\\Query")
extern class Query
{
    public function new(filter:Dynamic, ?queryOptions:Dynamic);
}