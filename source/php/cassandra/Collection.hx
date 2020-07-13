package php.cassandra;

@:native("Cassandra\\Collection")
extern class Collection implements Value
{
    public function new(type:Type);
    public function type():Type;
    public function values():Dynamic;
    public function add(value:Dynamic):Int;
    public function get(index:Int):Dynamic;
    public function find(value:Dynamic):Int;
    public function count():Int;
    public function current():Dynamic;
    public function key():Int;
    public function next():Void;
    public function valid():Bool;
    public function rewind():Void;
    public function remove(index:Int):Bool;
}