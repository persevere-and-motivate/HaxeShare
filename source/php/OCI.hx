package php;
#if !php
#error "You must target PHP to access the php.OCI class."
#end

import php.Resource;
import php.Ref;

@:phpGlobal
extern class OCI
{

    public static function oci_bind_array_by_name(statement:Resource, name:String, var_array:Ref<Array<Dynamic>>, max_table_length:Int, ?max_item_length:Int, ?type:Int):Bool;
    public static function oci_bind_by_name(statement:Resource, bv_name:String, variable:Ref<Dynamic>, ?maxLength:Int, ?type:Int):Bool;
    public static function oci_cancel(statement:Resource):Bool;
    public static function oci_client_version():String;
    public static function oci_close(connection:Resource):Bool;
    public static function oci_commit(connection:Resource):Bool;
    public static function oci_connect(username:String, password:String, ?connection_string:String, ?character_set:String, ?session_mode:Int):Resource;
    public static function oci_define_by_name(statement:Resource, column_name:String, variable:Ref<Dynamic>, ?type:Int):Bool;
    public static function oci_error(?resource:Resource):{ code:Int, message:String, offset:Int, sqltext:String };
    public static function oci_execute(statement:Resource, ?mode:Int):Bool;
    public static function oci_fetch_all(statement:Resource, output:Ref<Array<Dynamic>>, ?skip:Int, ?maxrows:Int, ?flags:Int):Int;
    public static function oci_fetch_array(statement:Resource, ?mode:Int):Dynamic;
    public static function oci_fetch_assoc(statement:Resource):Dynamic;
    public static function oci_fetch_object(statement:Resource):Dynamic;
    public static function oci_fetch_row(statement:Resource):Dynamic;
    public static function oci_fetch(statement:Resource):Bool;
    public static function oci_field_is_null(statement:Resource, field:Dynamic):Bool;
    public static function oci_field_name(statement:Resource, field:Dynamic):String;
    public static function oci_field_precision(statement:Resource, field:Dynamic):Int;
    public static function oci_field_scale(statement:Resource, field:Dynamic):Int;
    public static function oci_field_size(statement:Resource, field:Dynamic):Int;
    public static function oci_field_type_raw(statement:Resource, field:Dynamic):Int;
    public static function oci_field_type(statement:Resource, field:Dynamic):Dynamic;
    public static function oci_free_descriptor(descriptor:Resource):Bool;
    public static function oci_free_statement(statement:Resource):Bool;
    public static function oci_get_implicit_resultset(statement:Resource):Resource;
    public static function oci_internal_debug(onoff:Bool):Void;
    public static function oci_lob_copy(lob_to:OCI_Lob, lob_from:OCI_Lob, ?length:Int):Bool;
    public static function oci_lob_is_equal(lob1:OCI_Lob, lob2:OCI_Lob):Bool;
    public static function oci_new_collection(connection:Resource, tdo:String, ?schema:String):OCI_Collection;
    public static function oci_new_connect(username:String, password:String, ?connection_string:String, ?character_set:String, ?session_mode:Int):Resource;
    public static function oci_new_cursor(connection:Resource):Resource;
    public static function oci_new_descriptor(connection:Resource, ?type:Int):OCI_Lob;
    public static function oci_num_fields(statement:Resource):Resource;
    public static function oci_num_rows(statement:Resource):Int;
    public static function oci_parse(connection:Resource, sql_text:String):Resource;
    @:overload(function(dbname:String, username:String, old_password:String, new_password:String):Resource)
    public static function oci_password_change(connection:Resource, username:String, old_password:String, new_password:String):Bool;
    public static function oci_pconnect(username:String, password:String, ?connection_string:String, ?character_set:String, ?session_mode:Int):Resource;
    public static function oci_register_taf_callback(connection:Resource, ?callbackFn:Dynamic):Bool;
    public static function oci_result(statement:Resource, field:Dynamic):Dynamic;
    public static function oci_rollback(connection:Resource):Bool;
    public static function oci_server_version(connection:Resource):String;
    public static function oci_set_action(connection:Resource, action_name:String):Bool;
    public static function oci_set_call_timeout(connection:Resource, time_out:Int):Bool;
    public static function oci_set_client_identifier(connection:Resource, client_identifier:String):Bool;
    public static function oci_set_client_info(connection:Resource, client_info:String):Bool;
    public static function oci_set_db_operation(connection:Resource, dbop:String):Bool;
    public static function oci_set_edition(edition:String):Bool;
    public static function oci_set_module_name(connection:Resource, module_name:String):Bool;
    public static function oci_set_prefetch(statement:Resource, rows:Int):Bool;
    public static function oci_statement_type(statement:Resource):String;
    public static function oci_unregister_taf_callback(connection:Resource):Bool;

}