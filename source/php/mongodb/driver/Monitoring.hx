package php.mongodb.driver;

import php.mongodb.driver.monitoring.Subscriber;

extern class Monitoring
{

    @:native("MongoDB\\Driver\\Monitoring\\addSubscriber")
    public static function addSubscriber(subscriber:Subscriber):Void;

    @:native("MongoDB\\Driver\\Monitoring\\removeSubscriber")
    public static function removeSubscriber(subscriber:Subscriber):Void;
    
}