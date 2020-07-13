package php.cassandra;

@:native("Cassandra\\Session")
extern interface Session
{
    function execute(statement:Dynamic, options:Dynamic):Rows;
    function executeAsync(statement:Dynamic, options:Dynamic):FutureRows;
    function prepare(cql:String, options:Dynamic):PreparedStatement;
    function prepareAsync(cql:String, options:Dynamic):FuturePreparedStatement;
    function close(timeout:Float):Void;
    function closeAsync():FutureClose;
    function metrics():Dynamic;
    function schema():Schema;
}