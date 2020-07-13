package php.cassandra;

@:native("Cassandra\\UserTypeValue")
extern class UserTypeValue implements Value
{
    public function new(types:Dynamic);
    public function type():Type;
    public function values():Dynamic;
    public function set(value:Dynamic):Void;
    public function get(name:String):Dynamic;
    public function count():Int;
    public function current():Dynamic;
    public function key():Int;
    public function next():Void;
    public function valid():Bool;
    public function rewind():Void;
}