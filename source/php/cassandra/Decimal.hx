package php.cassandra;

@:native("Cassandra\\Decimal")
extern class Decimal implements Numeric implements Value
{
    
    public function new(value:String);
    public function __toString():String;
    public function type():Type;
    public function value():String;
    public function scale():Int;
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

}