package php.mongodb.driver;

import php.mongodb.bson.Timestamp;
import php.mongodb.bson.TimestampInterface;

@:native("MongoDB\\Driver\\Session")
extern class Session
{
    public static final TRANSACTION_NONE:String;
    public static final TRANSACTION_STARTING:String;
    public static final TRANSACTION_IN_PROGRESS:String;
    public static final TRANSACTION_COMMITTED:String;
    public static final TRANSACTION_ABORTED:String;

    private function new();
    public function abortTransaction():Void;
    public function advanceClusterTime(clusterTime:Dynamic):Void;
    public function advanceOperationTime(operationTime:TimestampInterface):Void;
    public function commitTransaction():Void;
    public function endSession():Void;
    public function getClusterTime():Dynamic;
    public function getLogicalSessionId():Dynamic;
    public function getOperationTime():Timestamp;
    public function getServer():Server;
    public function getTransactionOptions():Dynamic;
    public function getTransactionState():String;
    public function isInTransaction():Bool;
    public function startTransaction(?options:Dynamic):Void;
}