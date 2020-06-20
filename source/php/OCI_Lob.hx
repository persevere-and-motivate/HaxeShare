package php;
#if !php
#error "You must target PHP to access the php.OCI_Lob class."
#end

@:native("OCI-Lob")
extern class OCI_Lob
{

    public function new():OCI_Lob;
    public function append(from:OCI_Lob):Bool;
    public function close():Bool;
    public function eof():Bool;
    public function erase(?offset:Int, ?length:Int):Int;
    public function export(filename:String, ?start:Int, length:Int):Bool;
    public function flush(?flag:Int):Bool;
    public function free():Bool;
    public function getBuffering():Bool;
    public function import(filename:String):Bool;
    public function load():String;
    public function read(length:Int):String;
    public function rewind():Bool;
    public function save(data:String, ?offset:Int):Bool;
    public function seek(offset:Int, ?whence:Int):Bool;
    public function setBuffering(on_off:Bool):Bool;
    public function size():Int;
    public function tell():Int;
    public function truncate(length:Int):Bool;
    public function write(data:String, ?length:Int):Int;
    public function writeTemporary(data:String, ?lob_type:Int):Bool;

}