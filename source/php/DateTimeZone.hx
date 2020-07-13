package php;

extern class DateTimeZone
{
    public static final AFRICA:Int;
    public static final AMERICA:Int;
    public static final ANTARCTICA:Int;
    public static final ARCTIC:Int;
    public static final ASIA:Int;
    public static final ATLANTIC:Int;
    public static final AUSTRALIA:Int;
    public static final EUROPE:Int;
    public static final INDIAN:Int;
    public static final PACIFIC:Int;
    public static final UTC:Int;
    public static final ALL:Int;
    public static final ALL_WITH_BC:Int;
    public static final PER_COUNTRY:Int;

    public function new(timezone:String);
    public function getLocation():Dynamic;
    public function getName():String;
    public function getOffset(datetime:DateTimeInterface):Int;
    public function getTransitions(?timestamp_begin:Int, ?timestamp_end:Int):Dynamic;
    public function listAbbreviations():Dynamic;
    public function listIdentifiers(?what:Int, ?country:String):Dynamic;
}