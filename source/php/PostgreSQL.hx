package php;
#if !php
#error "You must target PHP to access the php.PostgreSQL class."
#end

import haxe.extern.EitherType;
import php.Resource;

@:phpGlobal
extern class PostgreSQL
{

    public static function pg_affected_rows(result:Resource):Int;
    public static function pg_cancel_query(connection:Resource):Bool;
    public static function pg_client_encoding(?connection:Resource):String;
    public static function pg_close(?connection:Resource):Bool;
    public static function pg_connect_poll(connection:Resource):Int;
    public static function pg_connect(connection_string:String, ?connect_type:Int):Resource;
    public static function pg_connection_busy(connection:Resource):Bool;
    public static function pg_connection_reset(connection:Resource):Bool;
    public static function pg_connection_status(connection:Resource):Int;
    public static function pg_consume_input(connection:Resource):Bool;
    public static function pg_convert(connection:Resource, table_name:String, assoc_array:Array<Int>, ?options:Int):EitherType<Array<Dynamic>, Bool>;
    public static function pg_copy_from(connection:Resource, table_name:String, rows:Array<String>, ?delimiter:String, ?null_as:String):Bool;
    public static function pg_copy_to(connection:Resource, table_name:String, ?delimiter:String, ?null_as:String):EitherType<Array<String>, Bool>;
    public static function pg_dbname(connection:Resource):String;
    public static function pg_delete(connection:Resource, table_name:String, assoc_array:Map<String, String>, ?options:Int):Dynamic;
    public static function pg_end_copy(connection:Resource):Bool;
    public static function pg_escape_bytea(connection:Resource, data:String):String;
    public static function pg_escape_identifier(connection:Resource, data:String):String;
    public static function pg_escape_literal(connection:Resource, data:String):String;
    public static function pg_escape_string(connection:Resource, data:String):String;
    public static function pg_execute(connection:Resource, stmtname:String, params:Array<String>):Resource;
    public static function pg_fetch_all_columns(result:Resource, ?column:Int):Array<Dynamic>;
    public static function pg_fetch_all(result:Resource, ?result_type:Int):Array<Dynamic>;
    public static function pg_fetch_array(result:Resource, ?row:Int, ?result_type:Int):Array<String>;
    public static function pg_fetch_assoc(result:Resource, ?row:Int):Array<String>;

    @:overload(function(result:Resource, ?row:Int, ?class_name:String, ?params:Array<Dynamic>):Dynamic)
    public static function pg_fetch_object(result:Resource, ?row:Int, ?result_type:Int):Dynamic;

    @:overload(function(result:Resource, field:Dynamic):String)
    public static function pg_fetch_result(result:Resource, row:Int, field:Dynamic):String;

    public static function pg_fetch_row(result:Resource, ?row:Int):Array<String>;

    @:overload(function(result:Resource, field:Dynamic):Int)
    public static function pg_field_is_null(result:Resource, row:Int, field:Dynamic):Int;

    public static function pg_field_name(result:Resource, field_number:Int):String;
    public static function pg_field_num(result:Resource, field_name:String):Int;

    @:overload(function(result:Resource, field_name_or_number:Dynamic):Int)
    public static function pg_field_prtlen(result:Resource, row_number:Int, field_name_or_number:Dynamic):Int;

    public static function pg_field_size(result:Resource, field_number:Int):Int;
    public static function pg_field_table(result:Resource, field_number:Int, ?oid_only:Bool):Dynamic;
    public static function pg_field_type_oid(result:Resource, field_number:Int):Int;
    public static function pg_field_type(result:Resource, field_number:Int):String;
    public static function pg_flush(connection:Result):Dynamic;
    public static function pg_free_result(result:Resource):Bool;
    public static function pg_get_notify(connection:Resource, ?result_type:Int):Array<Dynamic>;
    public static function pg_get_pid(connection:Resource):Int;
    public static function pg_get_result(?connection:Resource):Resource;
    public static function pg_host(?connection:Resource):String;
    public static function pg_insert(connection:Resource, table_name:String, assoc_array:Map<String, Dynamic>, ?options:Int):Dynamic;
    public static function pg_last_error(?connection:Resource):String;
    public static function pg_last_notice(connection:Resource, ?option:Int):Dynamic;
    public static function pg_last_oid(result:Resource):String;
    public static function pg_lo_close(large_object:Resource):Bool;
    
    @:overload(function(object_id:Dynamic):Int)
    public static function pg_lo_create(?connection:Resource, ?object_id:Dynamic):Int;
    public static function pg_lo_export(connection:Resource, oid:Int, pathname:String):Bool;
    public static function pg_lo_import(connection:Resource, pathname:String, ?object_id:Dynamic):Int;
    public static function pg_lo_open(connection:Resource, oid:Int, mode:String):Resource;
    public static function pg_lo_read_all(large_object:Resource):Int;
    public static function pg_lo_read(large_object:Resource, ?len:Int):String;
    public static function pg_lo_seek(large_object:Resource, offset:Int, ?whence:Int):Bool;
    public static function pg_lo_tell(large_object:Resource):Int;
    public static function pg_lo_truncate(large_object:Resource, size:Int):Bool;
    public static function pg_lo_unlink(connection:Resource, oid:Int):Bool;
    public static function pg_lo_write(large_object:Resource, data:String, ?len:Int):Int;
    public static function pg_meta_data(connection:Resource, table_name:String, ?extended:Bool):Array<Dynamic>;
    public static function pg_num_fields(result:Resource):Int;
    public static function pg_num_rows(result:Resource):Int;
    public static function pg_options(?connection:Resource):String;
    public static function pg_parameter_status(connection:Resource, param_name:String):String;
    public static function pg_pconnect(connection_string:String, ?connect_type:Int):Resource;
    public static function pg_ping(connection:Resource):Bool;
    public static function pg_port(connection:Resource):Int;
    public static function pg_prepare(connection:Resource, stmtname:String, query:String):Resource;
    public static function pg_put_line(connection:Resource, data:String):Bool;
    public static function pg_query_params(connection:Resource, query:String, params:Array<String>):Resource;
    public static function pg_query(connection:Resource, query:String):Resource;
    public static function pg_result_error_field(result:Resource, fieldcode:Int):String;
    public static function pg_result_error(result:Resource):String;
    public static function pg_result_seek(result:Resource, offset:Int):Bool;
    public static function pg_result_status(result:Resource, ?type:Int):Dynamic;
    public static function pg_select(connection:Resource, table_name:String, assoc_array:Map<String, Dynamic>, ?options:Int, ?result_type:Int):Dynamic;
    public static function pg_send_execute(connection:Resource, stmtname:String, params:Array<String>):Bool;
    public static function pg_send_prepare(connection:Resource, stmtname:String, query:String):Bool;
    public static function pg_send_query_params(connection:Resource, query:String, params:Aray<String>):Bool;
    public static function pg_send_query(connection:Resource, query:String):Bool;
    public static function pg_set_client_encoding(connection:Resource, encoding:String):Int;
    public static function pg_set_error_verbosity(connection:Resource, verbosity:Int):Int;
    public static function pg_socket(connection:Resource):Resource;
    public static function pg_trace(pathname:String, ?mode:String, ?connection:Resource):Bool;
    public static function pg_transaction_status(connection:Resource):Int;
    public static function pg_tty(?connection:Resource):String;
    public static function pg_unescape_bytea(data:String):String;
    public static function pg_untrace(?connection:Resource):Bool;
    public static function pg_update(connection:Resource, table_name:String, data:Map<String, Dynamic>, condition:Map<String, Dynamic>, ?options:Int):Dynamic;
    public static function pg_version(?connection:Resource):Dynamic;

}