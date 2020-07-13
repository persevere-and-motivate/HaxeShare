package php.cassandra;

@:native("Cassandra\\Table")
extern interface Table
{
    function name():String;
    function option(name:String):Value;
    function options():Dynamic;
    function comment():String;
    function readRepairChance():Float;
    function localReadRepairChance():Float;
    function gcGraceSeconds():Int;
    function caching():String;
    function bloomFilterFPChance():Float;
    function memtableFlushPeriodMs():Int;
    function defaultTTL():Int;
    function speculativeRetry():String;
    function indexInterval():Int;
    function compactionStrategyClassName():String;
    function compactionStrategyOptions():Map;
    function compressionParameters():Map;
    function populateIOCacheOnFlush():Bool;
    function replicateOnWrite():Bool;
    function maxIndexInterval():Int;
    function minIndexInterval():Int;
    function column(name:String):Column;
    function columns():Dynamic;
    function partitionKey():Dynamic;
    function primaryKey():Dynamic;
    function clusteringKey():Dynamic;
    function clusteringOrder():Dynamic;
}