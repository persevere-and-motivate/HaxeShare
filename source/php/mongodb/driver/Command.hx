package php.mongodb.driver;

@:native("MongoDB\\Driver\\Command")
extern class Command
{
    public function new(document:Dynamic, ?commandOptions:Dynamic);
}