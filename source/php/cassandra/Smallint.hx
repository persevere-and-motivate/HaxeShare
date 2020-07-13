package php.cassandra;

@:native("Cassandra\\Smallint")
extern class Smallint implements Value implements Numeric
{
    public function new(value:Dynamic);
    public function __toString():String;
    public function type():Type;
    public function value():Int;
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
    public static function min():Smallint;
    public static function max():Smallint;
}