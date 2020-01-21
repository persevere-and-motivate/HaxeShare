package hxshare;

class Router
{

    static var _routes:Array<String>;
    static var _routeIndex:Int;

    /**
    * Sets the URL of the router to check.
    * 
    * @param url The URL to parse and check.
    **/
    public static function route(url:String)
    {
        _routeIndex = 0;
        _routes = url.split("/");
    }

    /**
    * Match each component of the URL passed into `route()` divided by it's "/".
    * Increments the index of the route array when a match is found.
    *
    * @param value The value to match against the URL.
    **/
    public static function matches(value:String)
    {
        if (_routes[_routeIndex] == value)
        {
            _routeIndex++;
            return true;
        }

        return false;
    }

    /**
    * Get the next value in the router.
    **/
    public static function next()
    {
        return _routes[_routeIndex++];
    }

    /**
    * Find out if the URL has a component after the current matching
    * URL.
    *
    * @param add (Optional) Add a value to the number of components forward you want to check.
    **/
    public static function hasNext(?add:Int = 0)
    {
        return (_routeIndex + 1 + add < _routes.length);
    }

    /**
    * Get a value to determine if the number of components in the URL is exactly as given.
    *
    * @param routes Number of component routes to check.
    **/
    public static function isExactly(routes:Int)
    {
        return routes == _routes.length;
    }

    /**
    * Gets the rest of the route from the current route index as a URL.
    **/
    public static function remainder()
    {
        var result = "";
        for (i in _routeIndex..._routes.length)
        {
            result += _routes[i] + "/";
        }

        result = result.substr(0, result.length - 1);

        return result;
    }

}