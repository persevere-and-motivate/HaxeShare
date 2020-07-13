package php.cassandra;

import php.cassandra.cluster.Builder in ClusterBuilder;
import php.cassandra.ssloptions.Builder;

extern class Cassandra
{
    public static final CONSISTENCY_ANY:Int;
    public static final CONSISTENCY_ONE:Int;
    public static final CONSISTENCY_TWO:Int;
    public static final CONSISTENCY_THREE:Int;
    public static final CONSISTENCY_QUORUM:Int;
    public static final CONSISTENCY_ALL:Int;
    public static final CONSISTENCY_LOCAL_QUORUM:Int;
    public static final CONSISTENCY_EACH_QUORUM:Int;
    public static final CONSISTENCY_SERIAL:Int;
    public static final CONSISTENCY_LOCAL_SERIAL:Int;
    public static final CONSISTENCY_LOCAL_ONE:Int;
    public static final VERIFY_NONE:Int;
    public static final VERIFY_PEER_CERT:Int;
    public static final VERIFY_PEER_IDENTITY:Int;
    public static final BATCH_LOGGED:Int;
    public static final BATCH_UNLOGGED:Int;
    public static final BATCH_COUNTER:Int;
    public static final LOG_DISABLED:Int;
    public static final LOG_CRITICAL:Int;
    public static final LOG_ERROR:Int;
    public static final LOG_WARN:Int;
    public static final LOG_INFO:Int;
    public static final LOG_DEBUG:Int;
    public static final LOG_TRACE:Int;
    public static final TYPE_TEXT:String;
    public static final TYPE_ASCII:String;
    public static final TYPE_VARCHAR:String;
    public static final TYPE_BIGINT:String;
    public static final TYPE_SMALLINT:String;
    public static final TYPE_TINYINT:String;
    public static final TYPE_BLOB:String;
    public static final TYPE_BOOLEAN:String;
    public static final TYPE_COUNTER:String;
    public static final TYPE_DECIMAL:String;
    public static final TYPE_DOUBLE:String;
    public static final TYPE_FLOAT:String;
    public static final TYPE_INT:String;
    public static final TYPE_TIMESTAMP:String;
    public static final TYPE_UUID:String;
    public static final TYPE_VARINT:String;
    public static final TYPE_TIMEUUID:String;
    public static final TYPE_INET:String;
    public static final VERSION:String;
    public static final CPP_DRIVER_VERSION:String;

    public static function cluster():ClusterBuilder;
    public static function ssl():Builder;
}