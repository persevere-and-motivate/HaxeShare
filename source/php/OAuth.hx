package php;
#if !php
#error "You must target PHP to use the php.OAuth class."
#end

/**
* Documentation for this class has been retrieved from:
* https://www.php.net/manual/en/class.oauth.php
*
**/
extern class OAuth
{

//
// Member Fields
//

    public var debug:Dynamic;
    public var sslChecks:Dynamic;
    public var debugInfo:Dynamic;

    /**
    * Creates a new OAuth object
    *
    * @param consumer_key The consumer key provided by the service provider.
    * @param consumer_secret The consumer secret provided by the service provider.
    * @param signature_method This optional parameter defines which signature method to use, by default it is OAUTH_SIG_METHOD_HMACSHA1 (HMAC-SHA1).
    * @param auth_type This optional parameter defines how to pass the OAuth parameters to a consumer, by default it is OAUTH_AUTH_TYPE_AUTHORIZATION (in the Authorization header).
    **/
    public function new(consumer_key:String, consumer_secret:String, ?signature_method:String, ?auth_type:Int);

    /**
    * Turns off verbose request information (off by default). Alternatively, the debug property can be set to a FALSE value to turn debug off.
    **/
    public function disableDebug():Bool;

    /**
    * Disable redirects from being followed automatically, thus allowing the request to be manually redirected.
    **/
    public function disableRedirects():Bool;

    /**
    * Turns off the usual SSL peer certificate and host checks, this is not for production environments. Alternatively, the sslChecks member can be set to FALSE to turn SSL checks off.
    **/
    public function disableSSLChecks():Bool;

    /**
    * Turns on verbose request information useful for debugging, the debug information is stored in the debugInfo member. Alternatively, the debug member can be set to a non-FALSE value to turn debug on.
    **/
    public function enableDebug():Bool;

    /**
    * Follow and sign redirects automatically, which is enabled by default.
    **/
    public function enableRedirects():Bool;

    /**
    * Turns on the usual SSL peer certificate and host checks (enabled by default). Alternatively, the sslChecks member can be set to a non-FALSE value to turn SSL checks off.
    **/
    public function enableSSLChecks():Bool;

    /**
    * Fetch a resource.
    *
    * @param protected_resource_url URL to the OAuth protected resource.
    * @param extra_parameters Extra parameters to send with the request for the resource.
    * @param http_method One of the OAUTH_HTTP_METHOD_* OAUTH constants, which includes GET, POST, PUT, HEAD, or DELETE.
    *   HEAD (OAUTH_HTTP_METHOD_HEAD) can be useful for discovering information prior to the request (if OAuth credentials are in the Authorization header).
    * @param http_headers HTTP client headers (such as User-Agent, Accept, etc.)
    *
    * @return Returns TRUE on success or FALSE on failure.
    **/
    public function fetch(protected_resource_url:String, ?extra_parameters:Array<String>, ?http_method:String, ?http_headers:Array<String>):Bool;

    /**
    * Generate a signature based on the final HTTP method, URL and a string/array of parameters.
    *
    * @param http_method HTTP method for request
    * @param url URL for request
    * @param extra_parameters String or array of additional parameters.
    * 
    * @return A string containing the generated signature or FALSE on failure
    **/
    public function generateSignature(http_method:String, url:String, ?extra_parameters:Any):Dynamic;

    /**
    * Fetch an access token, secret and any additional response parameters from the service provider.
    *
    * @param access_token_url URL to the access token API.
    * @param auth_session_handle Authorization session handle, this parameter does not have any citation in the core OAuth 1.0 specification but may be implemented by large providers. » See ScalableOAuth for more information.
    * @param verifier_token For service providers which support 1.0a, a verifier_token must be passed while exchanging the request token for the access token. If the verifier_token is present in $_GET or $_POST it is passed automatically and the caller does not need to specify a verifier_token (usually if the access token is exchanged at the oauth_callback URL). » See ScalableOAuth for more information.
    * @param http_method HTTP method to use, e.g. GET or POST.
    *
    * @return Returns an array containing the parsed OAuth response on success or FALSE on failure.
    **/
    public function getAccessToken(access_token_url:String, ?auth_session_handle:String, ?verifier_token:String, ?http_method:String):Dynamic;

    /**
    * Gets the Certificate Authority information, which includes the ca_path and ca_info set by OAuth::setCaPath().
    **/
    public function getCAPath():Array<{ ca_path:String, ca_info:String }>;

    /**
    * Get the raw response of the most recent request.
    **/
    public function getLastResponse():String;

    /**
    * Get headers for last response.
    *
    * @return A string containing the last response's headers or FALSE on failure
    **/
    public function getLastResponseHeaders():Dynamic;

    /**
    * Get HTTP information about the last response.
    *
    * @return Returns an array containing the response information for the last request. Constants from curl_getinfo() may be used.
    **/
    public function getLastResponseInfo():Array<Dynamic>;

    /**
    * Generate OAuth header string signature based on the final HTTP method, URL and a string/array of parameters
    *
    * @param http_method HTTP method for request.
    * @param url URL for request.
    * @param extra_parameters String or array of additional parameters.
    *
    * @return A string containing the generated request header or FALSE on failure
    **/
    public function getRequestHeader(http_method:String, url:String, extra_parameters:Any):String;

    /**
    * Fetch a request token, secret and any additional response parameters from the service provider.
    *
    * @param request_token_url URL to the request token API.
    * @param callback_url OAuth callback URL. If callback_url is passed and is an empty value, it is set to "oob" to address the OAuth 2009.1 advisory.
    * @param http_method HTTP method to use, e.g. GET or POST.
    *
    * @return Returns an array containing the parsed OAuth response on success or FALSE on failure.
    **/
    public function getRequestToken(request_token_url:String, ?callback_url:String, ?http_method:String):Dynamic;

    /**
    * Set where the OAuth parameters should be passed.
    * 
    * @param auth_type auth_type can be one of the following flags (in order of decreasing preference as per OAuth 1.0 section 5.2):
        OAUTH_AUTH_TYPE_AUTHORIZATION
        OAUTH_AUTH_TYPE_FORM
        OAUTH_AUTH_TYPE_URI
        OAUTH_AUTH_TYPE_NONE
    *
    * @return Returns TRUE if a parameter is correctly set, otherwise FALSE (e.g., if an invalid auth_type is passed in.)
    **/
    public function setAuthType(auth_type:Int):Bool;

    /**
    * Sets the Certificate Authority (CA), both for path and info.
    *
    * @param ca_path The CA Path being set.
    * @param ca_info The CA Info being set.
    *
    * @return Returns TRUE on success, or FALSE if either ca_path or ca_info are considered invalid.
    **/
    public function setCAPath(?ca_path:String, ?ca_info:String):Bool;

    /**
    * Sets the nonce for all subsequent requests.
    *
    * @param nonce The value for oauth_nonce.
    *
    * @return Returns TRUE on success, or FALSE if the nonce is considered invalid.
    **/
    public function setNonce(nonce:String):Bool;

    /**
    * Sets the Request Engine, that will be sending the HTTP requests.
    *
    * @param The desired request engine. Set to OAUTH_REQENGINE_STREAMS to use PHP Streams, or OAUTH_REQENGINE_CURL to use Curl.
    **/
    public function setRequestEngine(reqengine:Int):Void;

    /**
    * Sets the RSA certificate.
    * 
    * @param cert The RSA certificate.
    *
    * @return Returns TRUE on success, or FALSE on failure (e.g., the RSA certificate cannot be parsed.)
    **/
    public function setRSACertificate(cert:String):Bool;

    /**
    * Tweak specific SSL checks for requests.
    *
    * @return Returns TRUE on success or FALSE on failure.
    **/
    public function setSSLChecks(sslcheck:Int):Bool;

    /**
    * Sets the OAuth timestamp for subsequent requests.
    *
    * @return Returns TRUE, unless the timestamp is invalid, in which case FALSE is returned.
    **/
    public function setTimestamp(timestamp:String):Bool;

    /**
    * Set the token and secret for subsequent requests.
    *
    * @param token The OAuth token.
    * @param token_secret The OAuth token secret.
    *
    * @return Always returns TRUE.
    **/
    public function setToken(token:String, token_secret:String):Bool;

    /**
    * Sets the OAuth version for subsequent requests
    * 
    * @param version OAuth version, default value is always "1.0"
    *
    * @return Returns TRUE on success or FALSE on failure.
    **/
    public function setVersion(version:String):Bool;



}