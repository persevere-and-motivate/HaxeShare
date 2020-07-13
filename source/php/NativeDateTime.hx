package php;

@:native("DateTime")
extern class NativeDateTime
{
    @:native("DateTimeInterface::ATOM")
    public static final ATOM:String;
    @:native("DateTimeInterface::COOKIE")
    public static final COOKIE:String;
    @:native("DateTimeInterface::ISO8601")
    public static final ISO8601:String;
    @:native("DateTimeInterface::RFC822")
    public static final RFC822:String;
    @:native("DateTimeInterface::RFC850")
    public static final RFC850:String;
    @:native("DateTimeInterface::RFC1036")
    public static final RFC1036:String;
    @:native("DateTimeInterface::RFC1123")
    public static final RFC1123:String;
    @:native("DateTimeInterface::RFC7231")
    public static final RFC7231:String;
    @:native("DateTimeInterface::RFC2822")
    public static final RFC2822:String;
    @:native("DateTimeInterface::RFC3339")
    public static final RFC3339:String;
    @:native("DateTimeInterface::RFC3339_EXTENDED")
    public static final RFC3339_EXTENDED:String;
    @:native("DateTimeInterface::RSS")
    public static final RSS:String;
    @:native("DateTimeInterface::W3C")
    public static final W3C:String;

    public function new(?time:String, ?timezone:DateTimeZone);
    public function add(interval:DateInterval):NativeDateTime;
    public function modify(modify:String):NativeDateTime;
    public function setDate(year:Int, month:Int, day:Int):NativeDateTime;
    public function setISODate(year:Int, week:Int, ?day:Int):NativeDateTime;
    public function setTime(hour:Int, minute:Int, ?second:Int, ?microseconds:Int):NativeDateTime;
    public function setTimestamp(unixtimestamp:Int):NativeDateTime;
    public function setTimezone(timezone:DateTimeZone):NativeDateTime;
    public function sub(interval:DateInterval):NativeDateTime;
    public function diff(datetime2:DateTimeInterface, ?absolute:Bool):DateInterval;
    public function format(format:String):String;
    public function getOffset():Int;
    public function getTimestamp():Int;
    public function getTimezone():DateTimeZone;

    public static function createFromFormat(format:String, time:String, ?timezone:DateTimeZone):NativeDateTime;
    public static function getLastErrors():Dynamic;
    public static function __set_state(array:Dynamic):NativeDateTime;
}