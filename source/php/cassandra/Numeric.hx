package php.cassandra;

@:native("Cassandra\\Numeric")
extern interface Numeric
{
    function add(num:Numeric):Numeric;
    function sub(num:Numeric):Numeric;
    function mul(num:Numeric):Numeric;
    function div(num:Numeric):Numeric;
    function mod(num:Numeric):Numeric;
    function abs():Numeric;
    function neg():Numeric;
    function sqrt():Numeric;
    function toInt():Int;
    function toDouble():Float;
}