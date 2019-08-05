package hxshare;
#if php

import sys.io.File;

import php.Syntax;
import php.Lib;

using StringTools;

class Page
{

    private var _notFoundFile:String;
    private var _headerFile:String;
    private var _footerFile:String;

    private var _root:String;
    private var _result:String;

    /**
    * A series of key-value pairs. It is recommended to use
    * this for setting default values before any parsing is handled.
    **/
    public var fields:Map<String, String>;

    /**
    * Create a new `Page` useful for manipulating HTML before printing.
    **/
    public function new()
    {
        _result = "";

        _root = Syntax.code("$_SERVER['DOCUMENT_ROOT']") + "/";
        fields = new Map<String, String>();
    }

    /**
    * Add a key-value pair that represents HTML code. If adding HTML code
    * to an existing key, the HTML will be appended to that key.
    *
    * @param key The key name to use for this HTML.
    * @param html The HTML code to add.
    **/
    public function addHtml(key:String, html:String)
    {
        if (fields.exists(key))
        {
            var value = fields.get(key);
            value += html;
            fields.set(key, value);
        }
        else
        {
            fields.set(key, html);
        }
    }
    
    /**
    * Returns the root value of the URL.
    **/
    public function root() return _root;

    /**
    * Replaces the key added using `addHtml` inside the HTML of the current page.
    **/
    public function parseHtml(key:String)
    {
        _result = _result.replace(key, fields.get(key));
    }

    /**
    * Sets the header file of the page.
    **/
    public function setHeaderFile(file:String)
    {
        _headerFile = file;
    }

    /**
    * Sets the file used for anything "not found".
    **/
    public function setNotFoundFile(file:String)
    {
        _notFoundFile = file;
    }

    /**
    * Sets the footer file of the page.
    **/
    public function setFooterFile(file:String)
    {
        _footerFile = file;
    }

    /**
    * Retrieve a file relative to the root and appends it to the
    * HTML result of the page.
    **/
    public function getFile(file:String)
    {
        _result += File.getContent(_root + file);
    }

    /**
    * Parse an individual key-value pair inside the HTML of the page.
    **/
    public function parseValue(key:String, value:String)
    {
        _result = _result.replace(key, value);
    }

    /**
    * Parse a series of key-value pairs inside the HTML of the page.
    * Each field is used as the key, and it's value used for replacement.
    **/
    public function parseValues(obj:Dynamic)
    {
        for (f in Reflect.fields(obj))
        {
            _result = _result.replace("%" + f + "%", Reflect.field(obj, f));
        }
    }

    /**
    * Parse any or all default key-value pairs that already exist inside of
    * fields.
    **/
    public function parseDefaults()
    {
        for (k => v in fields)
        {
            _result = _result.replace(k, v);
        }
    }

    /**
    * Append raw HTML without any parsing to the HTML of the page.
    **/
    public function insertRawHtml(html:String)
    {
        _result += html;
    }

    /**
    * Reset the HTML of the page and display a page representing "not found".
    **/
    public function notfound()
    {
        _result = "";
        _result += File.getContent(_root + _headerFile);
        _result += File.getContent(_root + _notFoundFile);
        _result += File.getContent(_root + _footerFile);

        parseDefaults();

        Lib.print(_result);
    }

    /**
    * Print the resulting HTML of the page.
    **/
    public function print()
    {
        Lib.print(_result);
    }

    /**
    * Generate a "test.htm" file in the root of the server for
    * displaying the resulting HTML of any given URL.
    **/
    public function generateTestFile()
    {
        File.saveContent(_root + "test.htm", _result);
    }

}

#end