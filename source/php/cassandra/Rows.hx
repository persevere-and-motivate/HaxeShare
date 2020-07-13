package php.cassandra;

import php.ArrayAccess;

@:native("Cassandra\\Rows")
extern class Rows implements ArrayAccess<Int, Dynamic>
{
    public function new();
    public function count():Int;
    public function rewind():Void;
    public function current():Dynamic;
    public function key():Int;
    public function next():Void;
    public function valid():Bool;
    public function offsetExists(offset:Int):Bool;
    public function offsetGet(offset:Int):Dynamic;
    public function offsetSet(offset:Int, value:Dynamic):Void;
    public function offsetUnset(offset:Int):Void;
    public function isLastPage():Bool;
    public function nextPage(timeout:Float):Rows;
    public function nextPageAsync():Future;
    public function pagingStateToken():String;
    public function first():Dynamic;
}