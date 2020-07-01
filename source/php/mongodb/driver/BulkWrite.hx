package php.mongodb.driver;

@:native("MongoDB\\Driver\\BulkWrite")
extern class BulkWrite
{
    public function new(?options:Dynamic);
    public function count():Int;
    public function delete(filter:Dynamic, ?deleteOptions:Dynamic):Void;
    public function insert(document:Dynamic):Dynamic;
    public function update(filter:Dynamic, newObj:Dynamic, ?updateOptions:Dynamic):Void;
}