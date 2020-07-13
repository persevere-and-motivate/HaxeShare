package php.cassandra;

@:native("Cassandra\\Type")
extern class Type
{
    public function name():String;
    public function __toString():String;
    public static function ascii():Type;
    public static function bigint():Type;
    public static function smallint():Type;
    public static function tinyint():Type;
    public static function blob():Type;
    public static function boolean():Type;
    public static function counter():Type;
    public static function decimal():Type;
    public static function double():Type;
    public static function duration():Type;
    public static function float():Type;
    public static function int():Type;
    public static function text():Type;
    public static function timestamp():Type;
    public static function date():Type;
    public static function time():Type;
    public static function uuid():Type;
    public static function varchar():Type;
    public static function varint():Type;
    public static function timeuuid():Type;
    public static function inet():Type;
    public static function collection(type:Type):Type;
    public static function set(type:Type):Type;
    public static function map(keyType:Type, valueType:Type):Type;

}