package php.cassandra.type;

@:native("Cassandra\\Type\\UserType")
extern class UserType extends Type
{
    public function withName(string:String):Void;
    public function withKeyspace(keyspace:String):Void;
    public function keyspace():String;
    public function types():Dynamic;
    public function create(value:Dynamic):UserTypeValue;
}