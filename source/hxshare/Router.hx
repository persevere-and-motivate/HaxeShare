package hxshare;

import haxe.Json;

class Router
{

    private var _routeUrls:Array<String>;
    private var _routes:Array<Route>;

    private var _currentRoute:Array<String>;

    public function new()
    {
        _routeUrls = [];
        _routes = [];

        #if js
        js.Browser.window.addEventListener('hashchange', execute);
        #end
    }

    public function getCurrentRoute()
    {
        return _currentRoute;
    }

    /**
    * Add a route to the router.
    * 
    * @param url The URL to add the router.
    * @param options The options associated with the given URL.
    *
    * @return Returns the zero-based index of the new route for reference.
    **/
    public function addRoute(url:String, options:Route)
    {
        _routeUrls.push(url);
        _routes.push(options);

        return _routeUrls.length - 1;
    }

    /**
    * Executes the router, which retrieves the URL and finds a route match. If no such match is found,
    * this function does nothing.
    **/
    public function execute()
    {
        #if js
        var hash = js.Browser.location.hash;
        var url = "";

        if (hash != "")
        {
            url = hash.substr(1);
        }
        else
        {
            url = "/";
        }

        var client = url.split("/");

        for (i in 0..._routeUrls.length)
        {
            var routeUrl = _routeUrls[i];
            var routeParts = routeUrl.split("/");

            var match = true;

            if (client.length != routeParts.length)
                continue;

            if (url == routeUrl && routeUrl == "/")
            {
                _currentRoute = routeParts;
                executeRouteOptions(_routes[i]);
                break;
            }
            else
            {
                for (p in 0...routeParts.length)
                {
                    var part = routeParts[p];
                    if (client[p] != part && part.indexOf(":") != 0)
                    {
                        match = false;
                        break;
                    }
                }

                if (match)
                {
                    _currentRoute = routeParts;
                    executeRouteOptions(_routes[i]);
                    break;
                }
            }
        }
        #end
    }

    var _executeComplete:Bool;
    var _executeResults:Dynamic;

    function executeRouteOptions(options:Route)
    {
        if (options.dependsOn != null)
        {
            executeRouteOptions(_routes[options.dependsOn]);
        }

        #if js
        Request.getPage(options.page, function(content, success) {
            if (success)
            {
                if (options.withRequest != null)
                {
                    if (options.withRequest.length == 1)
                    {
                        executeRouteRequest(options, options.withRequest[0], content);
                    }
                }
                else
                {
                    new js.jquery.JQuery(options.selector).html(content);

                    if (options.proc != null)
                        options.proc();
                }
            }
        });
        #end
    }

    function executeRouteRequest(options:Route, request:RouteRequest, template:String)
    {
        switch (request.method)
        {
            case "GET":
                Request.get(request.restURL, function(content, success) {
                    if (success)
                    {
                        _executeResults = Json.parse(content);
                        var html = "";
                        if (_executeResults.length != null)
                        {
                            html = Request.templatise(template, _executeResults, request.replace, request.eachTemplate);
                        }
                        else
                        {
                            html = Request.templatise(template, _executeResults);
                        }

                        new js.jquery.JQuery(options.selector).html(html);

                        if (options.proc != null)
                            options.proc();
                    }
                });
            case "PUT":
                Request.put(request.restURL, request.data, function(content, success) {
                    if (success)
                    {
                        // Logging
                    }
                });
            case "POST":
                Request.post(request.restURL, request.data, function(content, success) {
                    if (success)
                    {
                        // Logging
                    }
                });
            case "DELETE":
                Request.delete(request.restURL, function(content, success) {
                    if (success)
                    {
                        // Logging
                    }
                });
        }
    }

}