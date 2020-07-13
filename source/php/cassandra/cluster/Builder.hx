package php.cassandra.cluster;

@:native("Cassandra\\Cluster\\Builder")
extern class Builder
{
    public function build():Cluster;
    public function withDefaultConsistency(consistency:Int):Builder;
    public function withDefaultPageSize(pageSize:Int):Builder;
    public function withDefaultTimeout(timeout:Float):Builder;
    public function withContactPoints(host:String):Builder;
    public function withPort(port:Int):Builder;
    public function withRoundRobinLoadBalancingPolicy():Builder;
    public function withDatacenterAwareRoundRobinLoadBalancingPolicy(localDatacenter:String, hostPerRemoteDatacenter:Int, useRemoteDatacenterForLocalConsistencies:Bool):Builder;
    public function withBlackListHosts(hosts:String):Builder;
    public function withWhiteListHosts(hosts:String):Builder;
    public function withBlackListDCs(dcs:String):Builder;
    public function withWhiteListDCs(dcs:String):Builder;
    public function withTokenAwareRouting(enabled:Bool):Builder;
    public function withCredentials(username:String, password:String):Builder;
    public function withConnectTimeout(timeout:Float):Builder;
    public function withRequestTimeout(timeout:Float):Builder;
    public function withSSL(options:SSLOptions):Builder;
    public function withPersistentSessions(enabled:Bool):Builder;
    public function withProtocolVersion(version:Int):Builder;
    public function withIOThreads(count:Int):Builder;
    public function withConnectionsPerHost(core:Int, max:Int):Builder;
    public function withReconnectInterval(interval:Float):Builder;
    public function withLatencyAwareRouting(enabled:Bool):Builder;
    public function withTCPNodelay(enabled:Bool):Builder;
    public function withTCPKeepalive(delay:Float):Builder;
    public function withRetryPolicy(policy:RetryPolicy):Builder;
    public function withTimestampGenerator(generator:TimestampGenerator):Builder;
    public function withSchemaMetadata(enabled:Bool):Builder;
    public function withHostnameResolution(enabled:Bool):Builder;
    public function withRandomizedContactPoints(enabled:Bool):Builder;
    public function withConnectionHeartbeatInterval(interval:Float):Builder;
}