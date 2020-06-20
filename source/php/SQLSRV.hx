package php;
#if !php
#error "You must target PHP to access the php.SQLSRV class."
#end

import php.Resource;

@:phpGlobal
extern class SQLSRV
{

    public static final SQLSRV_FETCH_ASSOC:Int;
    public static final SQLSRV_FETCH_NUMERIC:Int;
    public static final SQLSRV_FETCH_BOTH:Int;
    public static final SQLSRV_ERR_ALL:Int;
    public static final SQLSRV_ERR_ERRORS:Int;
    public static final SQLSRV_ERR_WARNINGS:Int;
    public static final SQLSRV_LOG_SYSTEM_ALL:Int;
    public static final SQLSRV_LOG_SYSTEM_CONN:Int;
    public static final SQLSRV_LOG_SYSTEM_INIT:Int;
    public static final SQLSRV_LOG_SYSTEM_OFF:Int;
    public static final SQLSRV_LOG_SYSTEM_STMT:Int;
    public static final SQLSRV_LOG_SYSTEM_UTIL:Int;
    public static final SQLSRV_LOG_SEVERITY_ALL:Int;
    public static final SQLSRV_LOG_SEVERITY_ERROR:Int;
    public static final SQLSRV_LOG_SEVERITY_NOTICE:Int;
    public static final SQLSRV_LOG_SEVERITY_WARNING:Int;
    public static final SQLSRV_NULLABLE_YES:Int;
    public static final SQLSRV_NULLABLE_NO:Int;
    public static final SQLSRV_NULLABLE_UNKNOWN:Int;
    public static final SQLSRV_PARAM_IN:Int;
    public static final SQLSRV_PARAM_INOUT:Int;
    public static final SQLSRV_PARAM_OUT:Int;
    public static final SQLSRV_PHPTYPE_INT:Int;
    public static final SQLSRV_PHPTYPE_DATETIME:Int;
    public static final SQLSRV_PHPTYPE_FLOAT:Int;
    public static final SQLSRV_PHPTYPE_STREAM:Int;
    public static final SQLSRV_PHPTYPE_STRING:Int;
    public static final SQLSRV_ENC_BINARY:Int;
    public static final SQLSRV_ENC_CHAR:Int;
    public static final SQLSRV_SQLTYPE_BIGINT:Int;
    public static final SQLSRV_SQLTYPE_BINARY:Int;
    public static final SQLSRV_SQLTYPE_BIT:Int;
    public static final SQLSRV_SQLTYPE_CHAR:Int;
    public static final SQLSRV_SQLTYPE_DATE:Int;
    public static final SQLSRV_SQLTYPE_DATETIME:Int;
    public static final SQLSRV_SQLTYPE_DATETIME2:Int;
    public static final SQLSRV_SQLTYPE_DATETIMEOFFSET:Int;
    public static final SQLSRV_SQLTYPE_DECIMAL:Int;
    public static final SQLSRV_SQLTYPE_FLOAT:Int;
    public static final SQLSRV_SQLTYPE_IMAGE:Int;
    public static final SQLSRV_SQLTYPE_INT:Int;
    public static final SQLSRV_SQLTYPE_MONEY:Int;
    public static final SQLSRV_SQLTYPE_NCHAR:Int;
    public static final SQLSRV_SQLTYPE_NUMERIC:Int;
    public static final SQLSRV_SQLTYPE_NVARCHAR:Int;
    public static final SQLSRV_SQLTYPE_NTEXT:Int;
    public static final SQLSRV_SQLTYPE_REAL:Int;
    public static final SQLSRV_SQLTYPE_SMALLDATETIME:Int;
    public static final SQLSRV_SQLTYPE_SMALLINT:Int;
    public static final SQLSRV_SQLTYPE_SMALLMONEY:Int;
    public static final SQLSRV_SQLTYPE_TEXT:Int;
    public static final SQLSRV_SQLTYPE_TIME:Int;
    public static final SQLSRV_SQLTYPE_TIMESTAMP:Int;
    public static final SQLSRV_SQLTYPE_TINYINT:Int;
    public static final SQLSRV_SQLTYPE_UNIQUEIDENTIFIER:Int;
    public static final SQLSRV_SQLTYPE_UDT:Int;
    public static final SQLSRV_SQLTYPE_VARBINARY:Int;
    public static final SQLSRV_SQLTYPE_VARCHAR:Int;
    public static final SQLSRV_SQLTYPE_XML:Int;
    public static final SQLSRV_TXN_READ_UNCOMMITTED:Int;
    public static final SQLSRV_TXN_READ_COMMITTED:Int;
    public static final SQLSRV_TXN_REPEATABLE_READ:Int;
    public static final SQLSRV_TXN_SNAPSHOT:Int;
    public static final SQLSRV_TXN_READ_SERIALIZABLE:Int;
    public static final SQLSRV_CURSOR_FORWARD:Int;
    public static final SQLSRV_CURSOR_STATIC:Int;
    public static final SQLSRV_CURSOR_DYNAMIC:Int;
    public static final SQLSRV_CURSOR_KEYSET:Int;
    public static final SQLSRV_CURSOR_BUFFERED:Int;
    public static final SQLSRV_SCROLL_NEXT:Int;
    public static final SQLSRV_SCROLL_PRIOR:Int;
    public static final SQLSRV_SCROLL_FIRST:Int;
    public static final SQLSRV_SCROLL_LAST:Int;
    public static final SQLSRV_SCROLL_ABSOLUTE:Int;
    public static final SQLSRV_SCROLL_RELATIVE:Int;

    public static function sqlsrv_begin_transaction(conn:Resource):Bool;
    public static function sqlsrv_cancel(stmt:Resource):Bool;
    public static function sqlsrv_client_info(conn:Resource):Dynamic;
    public static function sqlsrv_close(conn:Resource):Bool;
    public static function sqlsrv_commit(conn:Resource):Bool;
    public static function sqlsrv_configure(setting:String, value:Dynamic):Bool;
    public static function sqlsrv_connect(serverName:String, ?connectionInfo:Dynamic):Resource;
    public static function sqlsrv_errors(errorsOrWarnings:Int):Dynamic;
    public static function sqlsrv_execute(stmt:Resource):Bool;
    public static function sqlsrv_fetch(stmt:Resource, ?row:Int, ?offset:Int):Bool;
    public static function sqlsrv_fetch_array(stmt:Resource, ?fetchType:Int, ?row:Int, ?offset:Int):Dynamic;
    public static function sqlsrv_fetch_object(stmt:Resource, ?className:String, ?ctorParams:Array<Dynamic>, ?row:Int, ?offset:Int):Dynamic;
    public static function sqlsrv_field_metadata(stmt:Resource):Dynamic;
    public static function sqlsrv_free_stmt(stmt:Resource):Bool;
    public static function sqlsrv_get_config(setting:String):Dynamic;
    public static function sqlsrv_get_field(stmt:Resource, fieldIndex:Int, ?getAsType:Int):Dynamic;
    public static function sqlsrv_has_rows(stmt:Resource):Bool;
    public static function sqlsrv_next_result(stmt:Resource):Dynamic;
    public static function sqlsrv_num_fields(stmt:Resource):Dynamic;
    public static function sqlsrv_num_rows(stmt:Resource):Dynamic;
    public static function sqlsrv_prepare(conn:Resource, sql:String, ?params:Array<Dynamic>, ?options:Array<Dynamic>):Dynamic;
    public static function sqlsrv_query(conn:Resource, sql:String, ?params:Array<Dynamic>, ?options:Array<Dynamic>):Dynamic;
    public static function sqlsrv_rollback(conn:Resource):Bool;
    public static function sqlsrv_rows_affected(stmt:Resource):Int;
    public static function sqlsrv_send_stream_data(stmt:Resource):Bool;
    public static function sqlsrv_server_info(conn:Resource):{ SQLServerVersion:String, SQLServerName:String };

}