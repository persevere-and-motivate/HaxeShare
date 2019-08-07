package php;

/**
* Documentation for this class has been retrieved from:
* https://www.php.net/manual/en/class.oauthprovider.php
**/
extern class OAuthProvider
{

    /**
    * Initiates a new OAuthProvider object.
    * 
    * @param params_array Setting these optional parameters is limited to the CLI SAPI.
    **/
    final public function new(?params_array:Array<Dynamic>);

    /**
    * Add required oauth provider parameters.
    *
    * @param req_params The required parameters.
    *
    * @return Returns TRUE on success or FALSE on failure.
    **/
    public function addRequiredParameter(req_params:String):Bool;

    /**
    * Calls the registered consumer handler callback function, which is set with OAuthProvider::consumerHandler().
    **/
    public function callconsumerHandler():Void;

    /**
    * Calls the registered timestamp handler callback function, which is set with OAuthProvider::timestampNonceHandler().
    **/
    public function callTimestampNonceHandler():Void;

    /**
    * Calls the registered token handler callback function, which is set with OAuthProvider::tokenHandler().
    **/
    public function calltokenHandler():Void;

    /**
    * Checks an OAuth request.
    *
    * @param uri The optional URI, or endpoint.
    * @param method The HTTP method. Optionally pass in one of the OAUTH_HTTP_METHOD_* OAuth constants.
    **/
    public function checkOAuthRequest(?uri:String, ?method:String):Void;

    /**
    * Sets the consumer handler callback, which will later be called with OAuthProvider::callConsumerHandler().
    **/
    public function consumerHandler(callback_function:(OAuthProvider) -> Void):Void;

    /**
    * Generates a string of pseudo-random bytes.
    *
    * @param size The desired token length, in terms of bytes.
    * @param strong Setting to TRUE means /dev/random will be used for entropy, as otherwise the non-blocking /dev/urandom is used. This parameter is ignored on Windows.
    *
    * @return The generated token, as a string of bytes.
    **/
    final public static function generateToken(size:Int, ?strong:Bool):String;

    /**
    * The 2-legged flow, or request signing. It does not require a token.
    **/
    public function is2LeggedEndpoint(params_array:Dynamic):Void;

    /**
    * @param will_issue_request_token Sets whether or not it will issue a request token, thus determining if OAuthProvider::tokenHandler() needs to be called.
    **/
    public function isRequestTokenEndpoint(will_issue_request_token:Bool):Void;

    /**
    * Removes a required parameter.
    *
    * @param req_params The required parameter to be removed.
    *
    * @return Returns TRUE on success or FALSE on failure.
    **/
    final public function removeRequiredParameter(req_params:String):Bool;

    /**
    * Pass in a problem as an OAuthException, with possible problems listed in the OAuth constants section.
    **/
    final public static function reportProblem(oauthexception:String, ?send_headers:Bool):String;

    /**
    * Sets a parameter.
    *
    * @param param_key The parameter key.
    * @param param_val The optional parameter value. To exclude a parameter from signature verification, set its value to NULL.
    *
    * @return Returns TRUE on success or FALSE on failure.
    **/
    final public function setParam(param_key:String, ?param_val:Dynamic):Bool;

    /**
    * Sets the request tokens path.
    *
    * @param path The path.
    *
    * @return Always returns TRUE.
    **/
    final public function setRequestTokenPath(path:String):Bool;
    
    /**
    * Sets the timestamp nonce handler callback, which will later be called with OAuthProvider::callTimestampNonceHandler(). Errors related to timestamp/nonce are thrown to this callback.
    *
    * @param callback_function The callable functions name.
    **/
    public function timestampNonceHandler(callback_function:(OAuthProvider) -> Void):Void;

    /**
    * Sets the token handler callback, which will later be called with OAuthProvider::callTokenHandler().
    *
    * @param callback_function The callable functions name.
    **/
    public function tokenHandler(callback_function:(OAuthProvider) -> Void):Void;
}