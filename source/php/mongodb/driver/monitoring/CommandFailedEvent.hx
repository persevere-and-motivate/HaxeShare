package php.mongodb.driver.monitoring;

import php.Exception;
import php.mongodb.driver.Server;

@:native("MongoDB\\Driver\\Monitoring\\CommandFailedEvent")
extern class CommandFailedEvent
{

    public function getCommandName():String;
    public function getDurationMicros():Int;
    public function getError():Exception;
    public function getOperationId():String;
    public function getReply():Dynamic;
    public function getRequestId():String;
    public function getServer():Server;

}