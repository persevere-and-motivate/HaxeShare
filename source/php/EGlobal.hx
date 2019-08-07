package php;

/**
* Extra Global fields not found in the Haxe standard library.
*
* Documentation retrieved from php.net.
**/
@:phpGlobal
extern class EGlobal
{

    /**
    * This constant represents putting OAuth parameters in the Authorization header.
    **/
    final static var OAUTH_AUTH_TYPE_AUTHORIZATION:String;
    
    /**
    * This constant represents putting OAuth parameters as part of the HTTP POST body.
    **/
    final static var OAUTH_AUTH_TYPE_FORM:String;
    
    /**
    * This constant represents putting OAuth parameters in the request URI.
    **/
    final static var OAUTH_AUTH_TYPE_URI:String;

    /**
    * This constant indicates a NoAuth OAuth request.
    **/
    final static var OAUTH_AUTH_TYPE_NONE:String;

    /**
    * Used by OAuth::setRequestEngine() to set the engine to PHP streams, as opposed to OAUTH_REQENGINE_CURL for Curl.
    **/
    final static var OAUTH_REQENGINE_STREAMS:Int;

    /**
    * Used by OAuth::setRequestEngine() to set the engine to Curl, as opposed to OAUTH_REQENGINE_STREAMS for PHP streams.
    **/
    final static var OAUTH_REQENGINE_CURL:Int;

    /**
    * OAuth HMAC-SHA1 signature method.
    **/
    final static var OAUTH_SIG_METHOD_HMACSHA1:String;

    /**
    * OAuth HMAC-SHA256 signature method.
    **/
    final static var OAUTH_SIG_METHOD_HMACSHA256:String;

    /**
    * OAuth RSA-SHA1 signature method.
    **/
    final static var OAUTH_SIG_METHOD_RSASHA1:String;

    /**
    * Use the GET method for the OAuth request.
    **/
    final static var OAUTH_HTTP_METHOD_GET:String;

    /**
    * Use the POST method for the OAuth request.
    **/
    final static var OAUTH_HTTP_METHOD_POST:String;

    /**
    * Use the PUT method for the OAuth request.
    **/
    final static var OAUTH_HTTP_METHOD_PUT:String;

    /**
    * Use the HEAD method for the OAuth request.
    **/
    final static var OAUTH_HTTP_METHOD_HEAD:String;

    /**
    * Use the DELETE method for the OAuth request.
    **/
    final static var OAUTH_HTTP_METHOD_DELETE:String;

    /**
    * Life is good.
    **/
    final static var OAUTH_OK:Int;

    /**
    * The oauth_nonce value was used in a previous request, therefore it cannot be used now.
    **/
    final static var OAUTH_BAD_NONCE:Int;

    /**
    * The oauth_timestamp value was not accepted by the service provider. In this case, the response should also contain the oauth_acceptable_timestamps parameter.
    **/
    final static var OAUTH_BAD_TIMESTAMP:Int;

    /**
    * The oauth_consumer_key is temporarily unacceptable to the service provider. For example, the service provider may be throttling the consumer.
    **/
    final static var OAUTH_CONSUMER_KEY_UNKNOWN:Int;

    /**
    * The consumer key was refused.
    **/
    final static var OAUTH_CONSUMER_KEY_REFUSED:Int;

    /**
    * The oauth_signature is invalid, as it does not match the signature computed by the service provider.
    **/
    final static var OAUTH_INVALID_SIGNATURE:Int;

    /**
    * The oauth_token has been consumed. It can no longer be used because it has already been used in the previous request(s).
    **/
    final static var OAUTH_TOKEN_USED:Int;

    /**
    * The oauth_token has expired.
    **/
    final static var OAUTH_TOKEN_EXPIRED:Int;

    /**
    * The oauth_token has been revoked, and will never be accepted.
    **/
    final static var OAUTH_TOKEN_REVOKED:Int;

    /**
    * The oauth_token was not accepted by the service provider. The reason is not known, but it might be because the token was never issued, already consumed, expired, and/or forgotten by the service provider.
    **/
    final static var OAUTH_TOKEN_REJECTED:Int;

    /**
    * The oauth_verifier is incorrect.
    **/
    final static var OAUTH_VERIFIER_INVALID:Int;

    /**
    * A required parameter was not received. In this case, the response should also contain the oauth_parameters_absent parameter.
    **/
    final static var OAUTH_PARAMETER_ABSENT:Int;

    /**
    * The oauth_signature_method was not accepted by service provider.
    **/
    final static var OAUTH_SIGNATURE_METHOD_REJECTED:Int;


    public static function oauth_get_sbs(http_method:String, uri:String, ?request_parameters:Array<Dynamic>):String;

    public static function oauth_urlencode(uri:String):String;

    /**
    * Generates cryptographic random integers that are suitable for use where unbiased results are critical, such as when shuffling a deck of cards for a poker game.
    *
    *   The sources of randomness used for this function are as follows:
    *
    *   On Windows, » `CryptGenRandom()` will always be used. As of PHP 7.2.0, the » CNG-API will always be used instead.
    *   On Linux, the » `getrandom(2)` syscall will be used if available.
    *   On other platforms, `/dev/urandom` will be used.
    *   If none of the aforementioned sources are available, then an Exception will be thrown.
    *
    * @param min The lowest value to be returned, which must be PHP_INT_MIN or higher.
    * @param max The highest value to be returned, which must be less than or equal to PHP_INT_MAX.
    *
    * @return Returns a cryptographically secure random integer in the range min to max, inclusive.
    *
    * @exception Exception If an appropriate source of randomness cannot be found, an Exception will be thrown.
    * @exception TypeError If invalid parameters are given, a TypeError will be thrown.
    * @exception Error If max is less than min, an Error will be thrown.
    **/
    public static function random_int(min:Int, max:Int):Int;

    /**
    * Generates an arbitrary length string of cryptographic random bytes that are suitable for cryptographic use, such as when generating salts, keys or initialization vectors.
    *
    *   The sources of randomness used for this function are as follows:
    *
    *   On Windows, » `CryptGenRandom()` will always be used. As of PHP 7.2.0, the » CNG-API will always be used instead.
    *   On Linux, the » `getrandom(2)` syscall will be used if available.
    *   On other platforms, `/dev/urandom` will be used.
    *   If none of the aforementioned sources are available, then an Exception will be thrown.
    *
    * @param length The length of the random string that should be returned in bytes.
    *
    * @return Returns a string containing the requested number of cryptographically secure random bytes.
    *
    * @exception Exception If an appropriate source of randomness cannot be found, an Exception will be thrown.
    * @exception TypeError If invalid parameters are given, a TypeError will be thrown.
    * @exception Error If an invalid length of bytes is given, an Error will be thrown.
    **/
    public static function random_bytes(length:Int):String;

}