package php.mongodb.driver;

@:native("MongoDB\\Driver\\Server")
extern class Server
{

    public static final TYPE_UNKNOWN:Int;
    public static final TYPE_STANDALONE:Int;
    public static final TYPE_MONGOS:Int;
    public static final TYPE_POSSIBLE_PRIMARY:Int;
    public static final TYPE_RS_PRIMARY:Int;
    public static final TYPE_RS_SECONDARY:Int;
    public static final TYPE_RS_ARBITER:Int;
    public static final TYPE_RS_OTHER:Int;
    public static final TYPE_RS_GHOST:Int;

    public function new();
    public function executeBulkWrite(namespace:String, bulk:BulkWrite, ?options:Dynamic):WriteResult;
    public function executeCommand(db:String, command:Command, ?options:Dynamic):Cursor;
    public function executeQuery(namespace:String, query:Query, ?options:Dynamic):Cursor;
    public function executeReadCommand(db:String, command:Command, ?options:Dynamic):Cursor;
    public function executeReadWriteCommand(db:String, command:Command, ?options:Dynamic):Cursor;
    public function executeWriteCommand(db:String, command:Command, ?options:Dynamic):Cursor;
    public function getHost():String;
    public function getInfo():Dynamic;
    public function getLatency():String;
    public function getPort():Int;
    public function getTags():Dynamic;
    public function getType():Int;
    public function isArbiter():Bool;
    public function isHidden():Bool;
    public function isPassive():Bool;
    public function isPrimary():Bool;
    public function isSecondary():Bool;

}