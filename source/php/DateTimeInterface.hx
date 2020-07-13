package php;

interface DateTimeInterface
{
    public function diff(datetime2:DateTimeInterface, ?absolute:Bool):DateInterval;
    public function format(format:String):String;
    public function getOffset():Int;
    public function getTimestamp():Int;
    public function getTimezone():DateTimeZone;
}