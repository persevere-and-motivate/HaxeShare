package php.cassandra;

import php.cassandra.type.UserType;

@:native("Cassandra\\DefaultKeyspace")
extern class DefaultKeyspace implements Keyspace
{
    public function name():String;
    public function replicationClassName():String;
    public function replicationOptions():Map;
    public function hasDurableWrites():String;
    public function table(name:String):Table;
    public function tables():Dynamic;
    public function userType(name:String):UserType;
    public function userTypes():Dynamic;
    public function materializedView(name:String):MaterializedView;
    public function materializedViews():Dynamic;
    @:native("function")
    public function _function(name:String, params:Dynamic):Function;
    public function functions():Dynamic;
    public function aggregate(name:String, params:Dynamic):Aggregate;
    public function aggregates():Dynamic;
}