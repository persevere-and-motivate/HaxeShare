package php.cassandra;

@:native("Cassandra\\Map")
extern class Map implements Value
{
    public function new(keyType:Type, valueType:Type);
    public function type():Type;
    public function keys():Dynamic;
    public function values():Dynamic;
    public function set(key:Dynamic, value:Dynamic):Dynamic;
    public function get(key:Dynamic):Dynamic;
    public function remove(key:Dynamic):Bool;
    public function has(key:Dynamic):Bool;
    public function count():Int;
    public function current():Dynamic;
    public function key():Int;
    public function next():Void;
    public function valid():Bool;
    public function rewind():Void;
    public function offsetSet(key:Dynamic, value:Dynamic):Void;
    public function offsetGet(key:Dynamic):Dynamic;
    public function offsetUnset(key:Dynamic):Void;
    public function offsetExists(key:Dynamic):Bool;
}