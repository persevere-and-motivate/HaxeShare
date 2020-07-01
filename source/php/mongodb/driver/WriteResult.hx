package php.mongodb.driver;

@:native("MongoDB\\Driver\\WriteResult")
extern class WriteResult
{

    public function getDeletedCount():Null<Int>;
    public function getInsertedCount():Null<Int>;
    public function getMatchedCount():Null<Int>;
    public function getModifiedCount():Null<Int>;
    public function getServer():Server;
    public function getUpsertedCount():Null<Int>;
    public function getUpsertedIds():Dynamic;
    public function getWriteConcernError():WriteConcernError;
    public function getWriteErrors():Dynamic;
    public function isAcknowledged():Bool;

}