package php.cassandra;

@:native("Cassandra\\Set")
extern class Set implements Value
{
    public function new(type:Type);
    public function type():Type;
    public function values():Dynamic;
    public function add(value:Dynamic):Bool;
    public function has(value:Dynamic):Bool;
    public function remove(value:Dynamic):Bool;
    public function count():Int;
    public function current():Dynamic;
    public function key():Int;
    public function next():Void;
    public function valid():Bool;
    public function rewind():Void;
}