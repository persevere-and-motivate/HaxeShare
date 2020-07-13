package php.cassandra;

import php.cassandra.type.UserType;

@:native("Cassandra\\Keyspace")
extern interface Keyspace
{
    function name():String;
    function replicationClassName():String;
    function replicationOptions():Map;
    function hasDurableWrites():String;
    function table(name:String):Table;
    function tables():Dynamic;
    function userType(name:String):UserType;
    function userTypes():Dynamic;
    function materializedView(name:String):MaterializedView;
    function materializedViews():Dynamic;
    function _function(name:String, params:Dynamic):Function;
    function functions():Dynamic;
    function aggregate(name:String, params:Dynamic):Aggregate;
    function aggregates():Dynamic;
}