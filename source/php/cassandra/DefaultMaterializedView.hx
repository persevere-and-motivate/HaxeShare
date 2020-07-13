package php.cassandra;

@:native("Cassandra\\DefaultMaterializedView")
extern class DefaultMaterializedView extends MaterializedView
{
    public function name():String;
    public function option(name:String):Value;
    public function options():Dynamic;
    public function comment():String;
    public function readRepairChance():Float;
    public function localReadRepairChance():Float;
    public function gcGraceSeconds():Int;
    public function caching():String;
    public function bloomFilterFPChance():Float;
    public function memtableFlushPeriodMs():Int;
    public function defaultTTL():Int;
    public function speculativeRetry():String;
    public function indexInterval():Int;
    public function compactionStrategyClassName():String;
    public function compactionStrategyOptions():Map;
    public function compressionParameters():Map;
    public function populateIOCacheOnFlush():Bool;
    public function replicateOnWrite():Bool;
    public function maxIndexInterval():Int;
    public function minIndexInterval():Int;
    public function column(name:String):Column;
    public function columns():Dynamic;
    public function partitionKey():Dynamic;
    public function primaryKey():Dynamic;
    public function clusteringKey():Dynamic;
    public function clusteringOrder():Dynamic;
    public function baseTable():Table;   
}