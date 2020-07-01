package php.mongodb.driver;

@:native("MongoDB\\Driver\\Manager")
extern class Manager
{
    public function new(?uri:String, ?uriOptions:Dynamic, ?driverOptions:Dynamic);
    public function createClientEncryption(options:Dynamic):ClientEncryption;
    public function executeBulkWrite(namespace:String, bulk:BulkWrite, ?options:Dynamic):WriteResult;
    public function executeCommand(db:String, command:Command, ?options:Dynamic):Cursor;
    public function executeQuery(namespace:String, query:Query, ?options:Dynamic):Cursor;
    public function executeReadCommand(db:String, command:Command, ?options:Dynamic):Cursor;
    public function executeReadWriteCommand(db:String, command:Command, ?options:Dynamic):Cursor;
    public function executeWriteCommand(db:String, command:Command, ?options:Dynamic):Cursor;
    public function getReadConcern():ReadConcern;
    public function getReadPreference():ReadPreference;
    public function getServers():Array<Server>;
    public function getWriteConcern():WriteConcern;
    public function selectServer(readPreference:ReadPreference):Server;
    public function startSession(?options:Dynamic):Session;
}