package hxshare;

import haxe.Json;
#if js
import js.html.XMLHttpRequest;
#end

class Request
{

    #if js
    /**
    * Requests from the server a page that can be displayed.
    * @param url The resource to get.
    * @param cb The callback with a string of the return resource and a boolean determining if the request was successful.
    * If the request returns `false`, the string value is an error message.
    **/
    public static function getPage(url:String, cb:String -> Bool -> Void)
    #elseif php
    /**
    * Requests a page with the given URL and returns the contents.
    * @param url The resource to get.
    * @return Returns a value representing the content of the URL.
    **/
    public static function getPage(url:String)
    #end
    {
        #if js
        var request = new XMLHttpRequest();
        request.onreadystatechange = function() {
            if (request.status == 200 && request.readyState == 4)
            {
                if (request.responseText == null)
                    cb("Error trying to load page '" + url + "'. Does the resource exist?", false);
                else
                    cb(request.responseText, true);
            }
        };
        request.open("GET", url);
        request.send();
        #elseif php
        if (sys.FileSystem.exists(url))
        {
            var content = sys.io.File.getContent(url);
            return content;
        }
        else
        {
            php.Web.setReturnCode(404);
            php.Lib.print("Requested URL could not be found.");
            return null;
        }
        #end
    }

    #if js
    /**
    * Requests from the server an object based on a REST url that can be displayed.
    * @param url The RESTful notation url request.
    * @param cb The callback with a string of the return resource and a boolean determining if the request was successful.
    * If the request returns `false`, the string value is an error message.
    **/
    public static function get(url:String, cb:String -> Bool -> Void)
    {
        var request = new XMLHttpRequest();
        request.onreadystatechange = function() {
            if (request.status == 200 && request.readyState == 4)
            {
                if (request.responseText == null)
                    cb("Error trying to retrieve data from URL '" + url + "'. Does the resource exist?", false);
                else
                    cb(request.responseText, true);
            }
        };
        request.open("GET", "includes/index.php?page=" + url);
        request.send();
    }

    /**
    * Requests that the data to be sent will insert respective of the URL given.
    * @param url The RESTful notation url request.
    * @param data An anonymous structure (likely a `typedef`) containing the data to send.
    * @param cb The callback with a string of the return resource and a boolean determining if the request was successful.
    * If the request returns `false`, the string value is an error message.
    **/
    public static function put(url:String, data:Dynamic, cb:String -> Bool -> Void)
    {
        var request = new XMLHttpRequest();
        request.onreadystatechange = function() {
            if (request.status == 200 && request.readyState == 4)
            {
                if (request.responseText == null)
                    cb("Error trying to retrieve data from URL '" + url + "'. Does the resource exist?", false);
                else
                    cb(request.responseText, true);
            }
        };
        request.setRequestHeader("Content-Type", "application/json");
        request.open("PUT", "includes/index.php?page=" + url);
        request.send(Json.stringify(data));
    }

    /**
    * Requests that the data to be sent will update respective of the URL given.
    * @param url The RESTful notation url request.
    * @param data An anonymous structure (likely a `typedef`) containing the data to send.
    * @param cb The callback with a string of the return resource and a boolean determining if the request was successful.
    * If the request returns `false`, the string value is an error message.
    **/
    public static function post(url:String, data:Dynamic, cb:String -> Bool -> Void)
    {
        var request = new XMLHttpRequest();
        request.onreadystatechange = function() {
            if (request.status == 200 && request.readyState == 4)
            {
                if (request.responseText == null)
                    cb("Error trying to retrieve data from URL '" + url + "'. Does the resource exist?", false);
                else
                    cb(request.responseText, true);
            }
        };
        request.setRequestHeader("Content-Type", "application/json");
        request.open("POST", "includes/index.php?page=" + url);
        request.send(Json.stringify(data));
    }

    /**
    * Requests that the server delete the given resource.
    * @param url The RESTful notation url request.
    * @param cb The callback with a string of the return resource and a boolean determining if the request was successful.
    * If the request returns `false`, the string value is an error message.
    **/
    public static function delete(url:String, cb:String -> Bool -> Void)
    {
        var request = new XMLHttpRequest();
        request.onreadystatechange = function() {
            if (request.status == 200 && request.readyState == 4)
            {
                if (request.responseText == null)
                    cb("Error trying to retrieve data from URL '" + url + "'. Does the resource exist?", false);
                else
                    cb(request.responseText, true);
            }
        };
        request.open("DELETE", "includes/index.php?page=" + url);
        request.send();
    }
    #end

}
#end