package php.cassandra;

@:native("Cassandra\\DefaultSession")
extern class DefaultSession implements Session
{
    public function execute(statement:Dynamic, options:Dynamic):Rows;
    public function executeAsync(statement:Dynamic, options:Dynamic):FutureRows;
    public function prepare(cql:String, options:Dynamic):PreparedStatement;
    public function prepareAsync(cql:String, options:Dynamic):FuturePreparedStatement;
    public function close(timeout:Float):Void;
    public function closeAsync():FutureClose;
    public function metrics():Dynamic;
    public function schema():Schema;
}