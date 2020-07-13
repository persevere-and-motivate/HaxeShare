package hxshare.db;

enum abstract Vendor(Int)
{
    var VENDOR_MYSQL            =   1;
    var VENDOR_SQLLITE          =   2;
    var VENDOR_POSTGRESQL       =   3;
    var VENDOR_ORACLE           =   4;
    var VENDOR_MSSSQL           =   5;
    var VENDOR_CASSANDRA        =   6;
    var VENDOR_MONGODB          =   7;
}