package php;
#if !php
#error "You must target PHP to access the php.OCIGlobals class."
#end

@:phpGlobal
extern class OCIGlobals
{

    public static final OCI_ASSOC:Int;
    public static final OCI_BOTH:Int;
    public static final OCI_COMMIT_ON_SUCCESS:Int;
    public static final OCI_CRED_EXT:Int;
    public static final OCI_DEFAULT:Int;
    public static final OCI_DESCRIBE_ONLY:Int;
    public static final OCI_EXACT_FETCH:Int;
    public static final OCI_FETCHSTATEMENT_BY_COLUMN:Int;
    public static final OCI_FETCHSTATEMENT_BY_ROW:Int;
    public static final OCI_LOB_BUFFER_FREE:Int;
    public static final OCI_NO_AUTO_COMMIT:Int;
    public static final OCI_NUM:Int;
    public static final OCI_RETURN_LOBS:Int;
    public static final OCI_RETURN_NULLS:Int;
    public static final OCI_SEEK_CUR:Int;
    public static final OCI_SEEK_END:Int;
    public static final OCI_SEEK_SET:Int;
    public static final OCI_SYSDATE:Int;
    public static final OCI_SYSDBA:Int;
    public static final OCI_SYSOPER:Int;
    public static final OCI_TEMP_BLOB:Int;
    public static final OCI_TEMP_CLOB:Int;
    public static final OCI_B_BFILE:Int;
    public static final OCI_B_BIN:Int;
    public static final OCI_B_BLOB:Int;
    public static final OCI_B_BOL:Int;
    public static final OCI_B_CFILEE:Int;
    public static final OCI_B_CLOB:Int;
    public static final OCI_B_CURSOR:Int;
    public static final OCI_B_INT:Int;
    public static final OCI_B_NTY:Int;
    public static final OCI_B_NUM:Int;
    public static final OCI_B_ROWID:Int;
    public static final SQLT_AFC:Int;
    public static final SQLT_AVC:Int;
    public static final SQLT_BDOUBLE:Int;
    public static final SQLT_BFILEE:Int;
    public static final SQLT_BFLOAT:Int;
    public static final SQLT_BIN:Int;
    public static final SQLT_BLOB:Int;
    public static final SQLT_BOL:Int;
    public static final SQLT_CFILEE:Int;
    public static final SQLT_CHR:Int;
    public static final SQLT_CLOB:Int;
    public static final SQLT_FLT:Int;
    public static final SQLT_INT:Int;
    public static final SQLT_LBI:Int;
    public static final SQLT_LNG:Int;
    public static final SQLT_LVC:Int;
    public static final SQLT_NTY:Int;
    public static final SQLT_NUM:Int;
    public static final SQLT_ODT:Int;
    public static final SQLT_RDD:Int;
    public static final SQLT_RSET:Int;
    public static final SQLT_STR:Int;
    public static final SQLT_UIN:Int;
    public static final SQLT_VCS:Int;
    public static final OCI_DTYPE_FILE:Int;
    public static final OCI_DTYPE_LOB:Int;
    public static final OCI_DTYPE_ROWID:Int;
    public static final OCI_D_FILE:Int;
    public static final OCI_D_LOB:Int;
    public static final OCI_D_ROWID:Int;

}