package php;
#if !php
#error "You must target PHP to use the php.OAuthException class."
#end

import php.Exception;

extern class OAuthException extends Exception
{

    /**
    * The response of the exception which occurred, if any
    **/
    public var lastResponse:Dynamic;

    public var debugInfo:Dynamic;

}