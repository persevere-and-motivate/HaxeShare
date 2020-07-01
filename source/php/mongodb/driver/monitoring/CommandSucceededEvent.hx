package php.mongodb.driver.monitoring;

import php.mongodb.driver.Server;

@:native("MongoDB\\Driver\\Monitoring\\CommandSucceededEvent")
extern class CommandSucceededEvent
{
    public function getCommandName():String;
    public function getDurationMicros():Int;
    public function getOperationId():String;
    public function getReply():Dynamic;
    public function getRequestId():String;
    public function getServer():Server;
}