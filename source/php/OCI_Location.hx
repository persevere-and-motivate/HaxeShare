package php;
#if !php
#error "You must target PHP to access the php.OCI_Location class."
#end

@:native("OCI-Location")
extern class OCI_Location
{

    public function new():OCI_Location;
    public function append(value:Dynamic):Bool;
    public function assign(from:OCI_Location):Bool;
    public function assignElem(index:Int, value:Dynamic):Bool;
    public function free():Bool;
    public function getElem(index:Int):Dynamic;
    public function max():Int;
    public function size():Int;
    public function trim(num:Int):Bool;    

}