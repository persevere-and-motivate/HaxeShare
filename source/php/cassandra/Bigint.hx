package php.cassandra;

@:native("Cassandra\\Bigint")
extern class Bigint implements Value implements Numeric
{
    public function new(value:String);
    public function __toString():String;
    public function type():Type;
    public function value():String;
    public function add(num:Numeric):Numeric;
    public function sub(num:Numeric):Numeric;
    public function mul(num:Numeric):Numeric;
    public function div(num:Numeric):Numeric;
    public function mod(num:Numeric):Numeric;
    public function abs():Numeric;
    public function neg():Numeric;
    public function sqrt():Numeric;
    public function toInt():Int;
    public function toDouble():Float;
    public static function min():Bigint;
    public static function max():Bigint;
}