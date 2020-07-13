package php;

@:native("DateInterval")
extern class DateInterval
{
    public var y:Int;
    public var m:Int;
    public var d:Int;
    public var h:Int;
    public var i:Int;
    public var s:Int;
    public var f:Float;
    public var invert:Int;
    public var days:Dynamic;

    public function new(interval_spec:String);
    public function format(format:String):String;
    public static function createFromDateString(time:String):DateInterval;
}