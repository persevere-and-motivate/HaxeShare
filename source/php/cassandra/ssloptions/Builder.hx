package php.cassandra.ssloptions;

@:native("Cassandra\\SSLOptions\\Builder")
extern class Builder
{
    public function build():SSLOptions;
    public function withTrustedCerts(path:String):Builder;
    public function withVerifyFlags(flags:Int):Builder;
    public function withClientCert(path:String):Builder;
    public function withPrivateKey(path:String, passphrase:String):Builder;
}