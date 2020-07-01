package php.mongodb.driver;

import php.mongodb.bson.Binary;

@:native("MongoDB\\Driver\\ClientEncryption")
extern class ClientEncryption
{
    public static final AEAD_AES_256_CBC_HMAC_SHA_512_DETERMINISTIC:String;
    public static final AEAD_AES_256_CBC_HMAC_SHA_512_RANDOM:String;

    public function createDataKey(kmsProvider:String, ?options:Dynamic):Binary;
    public function decrypt(value:Binary):Dynamic;
    public function encrypt(value:Dynamic, ?options:Dynamic):Binary;
}