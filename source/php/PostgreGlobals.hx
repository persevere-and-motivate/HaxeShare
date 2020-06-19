package php;
#if !php
#error "You must target PHP to access the php.PostgreGlobals class."
#end

@:phpGlobal
class PostgreGlobals
{

    public static final PGSQL_LIBPQ_VERSION:String;
    public static final PGSQL_LIBPQ_VERSION_STR:String;
    public static final PGSQL_ASSOC:Int;
    public static final PGSQL_NUM:Int;
    public static final PGSQL_BOTH:Int;
    public static final PGSQL_CONNECT_FORCE_NEW:Int;
    public static final PGSQL_CONNECT_ASYNC:Int;
    public static final PGSQL_CONNECTION_AUTH_OK:Int;
    public static final PGSQL_CONNECTION_AWAITING_RESPONSE:Int;
    public static final PGSQL_CONNECTION_BAD:Int;
    public static final PGSQL_CONNECTION_MADE:Int;
    public static final PGSQL_CONNECTION_OK:Int;
    public static final PGSQL_CONNECTION_SETENV:Int;
    public static final PGSQL_CONNECTION_SSL_STARTUP:Int;
    public static final PGSQL_CONNECTION_STARTED:Int;
    public static final PGSQL_SEEK_SET:Int;
    public static final PGSQL_SEEK_CUR:Int;
    public static final PGSQL_SEEK_END:Int;
    public static final PGSQL_EMPTY_QUERY:Int;
    public static final PGSQL_COMMAND_OK:Int;
    public static final PGSQL_TUPLES_OK:Int;
    public static final PGSQL_COPY_OUT:Int;
    public static final PGSQL_COPY_IN:Int;
    public static final PGSQL_BAD_RESPONSE:Int;
    public static final PGSQL_NONFATAL_ERROR:Int;
    public static final PGSQL_FATAL_ERROR:Int;
    public static final PGSQL_TRANSACTION_IDLE:Int;
    public static final PGSQL_TRANSACTION_ACTIVE:Int;
    public static final PGSQL_TRANSACTION_INTRANS:Int;
    public static final PGSQL_TRANSACTION_INERROR:Int;
    public static final PGSQL_TRANSACTION_UNKNOWN:Int;
    public static final PGSQL_DIAG_SEVERITY:Int;
    public static final PGSQL_DIAG_SQLSTATE:Int;
    public static final PGSQL_DIAG_MESSAGE_PRIMARY:Int;
    public static final PGSQL_DIAG_MESSAGE_DETAIL:Int;
    public static final PGSQL_DIAG_MESSAGE_HINT:Int;
    public static final PGSQL_DIAG_STATEMENT_POSITION:Int;
    public static final PGSQL_DIAG_INTERNAL_POSITION:Int;
    public static final PGSQL_DIAG_INTERNAL_QUERY:Int;
    public static final PGSQL_DIAG_CONTEXT:Int;
    public static final PGSQL_DIAG_SOURCE_FILE:Int;
    public static final PGSQL_DIAG_SOURCE_LINE:Int;
    public static final PGSQL_DIAG_SOURCE_FUNCTION:Int;
    public static final PGSQL_DIAG_SCHEMA_NAME:String;
    public static final PGSQL_DIAG_TABLE_NAME:String;
    public static final PGSQL_DIAG_COLUMN_NAME:String;
    public static final PGSQL_DIAG_DATATYPE_NAME:String;
    public static final PGSQL_DIAG_CONSTRAINT_NAME:String;
    public static final PGSQL_ERRORS_TERSE:Int;
    public static final PGSQL_ERRORS_DEFAULT:Int;
    public static final PGSQL_ERRORS_VERBOSE:Int;
    public static final PGSQL_NOTICE_LAST:Int;
    public static final PGSQL_NOTICE_ALL:Int;
    public static final PGSQL_NOTICE_CLEAR:Int;
    public static final PGSQL_STATUS_LONG:Int;
    public static final PGSQL_STATUS_STRING:Int;
    public static final PGSQL_CONV_IGNORE_DEFAULT:Int;
    public static final PGSQL_CONV_FORCE_NULL:Int;
    public static final PGSQL_CONV_IGNORE_NOT_NULL:Int;
    public static final PGSQL_DML_NO_CONV:Int;
    public static final PGSQL_DML_EXEC:Int;
    public static final PGSQL_DML_ASYNC:Int;
    public static final PGSQL_DML_STRING:Int;
    public static final PGSQL_DML_ESCAPE:Int;
    public static final PGSQL_POLLING_FAILED:Int;
    public static final PGSQL_POLLING_READING:Int;
    public static final PGSQL_POLLING_WRITING:Int;
    public static final PGSQL_POLLING_OK:Int;
    public static final PGSQL_POLLING_ACTIVE:Int;
    public static final PGSQL_DIAG_SEVERITY_NONLOCALIZED:Int;

}