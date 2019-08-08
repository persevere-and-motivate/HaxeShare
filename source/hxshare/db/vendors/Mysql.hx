package hxshare.db.vendors;

import hxshare.db.DBObject;

#if php
import php.db.Mysqli;
import php.db.Mysqli_result;
import php.db.Mysqli_stmt;
#end

class Mysql
{

    #if php
    static var _dbConn:Mysqli;
    #end

    public static function connect(host:String, user:String, pass:String, ?database:String = "", ?port:Int = 3306, ?socket:String = "")
    {
        #if php
        _dbConn = new Mysqli(host, user, pass, database, port, socket);

        if (_dbConn.connect_error != null)
        {
            return false;
        }
        #end

        return true;
    }

    public static function createDatabase(dbName:String)
    {
        #if php
        var sql = 'CREATE DATABASE $dbName';
        if (_dbConn.query(sql))
        {
            return true;
        }
        #end

        return false;
    }

    public static function select(table:String, ?filter:Map<String, String>, ?options:Dynamic):Array<DBObject>
    {
        var query = '';
        var bindings = [];

        query = 'SELECT * FROM `$table`';
        if (filter != null)
        {
            if (filter.keys().hasNext())
            {
                query += ' WHERE ';
                for (k => v in filter)
                {
                    query += '$k ';
                    if (v.indexOf(":") == 0)
                    {
                        query += getOperator(v) + ' ?';

                        var spaceIndex = v.lastIndexOf(" ") + 1;
                        var bindingValue = v.substr(spaceIndex, v.length - spaceIndex);
                        if (bindingValue == "s" || bindingValue == "i" || bindingValue == "d" || bindingValue == "b")
                            bindings.push(bindingValue);
                    }
                    else if (v.indexOf("%") > -1)
                    {
                        query += 'LIKE ?';

                        var spaceIndex = v.lastIndexOf(" ") + 1;
                        var bindingValue = v.substr(spaceIndex, v.length - spaceIndex);
                        if (bindingValue == "s" || bindingValue == "i" || bindingValue == "d" || bindingValue == "b")
                            bindings.push(bindingValue);
                    }
                    else
                    {
                        query += '= ?';

                        var spaceIndex = v.lastIndexOf(" ") + 1;
                        var bindingValue = v.substr(spaceIndex, v.length - spaceIndex);
                        if (bindingValue == "s" || bindingValue == "i" || bindingValue == "d" || bindingValue == "b")
                            bindings.push(bindingValue);
                    }
                }
            }
        }

        if (options != null)
        {
            if (options.limit != null)
            {
                if (Std.is(options.limit, Int))
                {
                    query += ' LIMIT ${options.limit}';
                }
                else if (Std.is(options.limit, Array))
                {
                    query += ' LIMIT ${options.limit[1]}, ${options.limit[0]}';
                }
            }

            if (options.orderBy != null)
            {
                if (Std.is(options.orderBy, String))
                {
                    var hasNegative = false;
                    if (options.orderBy.indexOf("-") == 0)
                        hasNegative = true;
                    

                }
            }

        }
    }

    public static function insert(table:String, data:Dynamic)
    {

    }

    public static function update(table:String, data:Dynamic, options:Dynamic)
    {

    }

    public static function delete(table:String, options:Dynamic)
    {

    }

    public static function callProcedure(procedure:String, args:Array<Dynamic>)
    {

    }

    public static function close()
    {
        #if php
        _dbConn.close();
        #end
    }


    static function getOperator(value:String)
    {
        var result = "";
        for (i in 0...value.length)
        {
            var char = value.charAt(i);
            if (char == ":")
                continue;
            else if (char == " ")
                break;
            else
                result += char;
        }
        return result;
    }

}