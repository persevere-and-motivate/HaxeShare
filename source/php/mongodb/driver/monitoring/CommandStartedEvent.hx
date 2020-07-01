package php.mongodb.driver.monitoring;

import php.mongodb.driver.Server;

@:native("MongoDB\\Driver\\Monitoring\\CommandStartedEvent")
extern class CommandStartedEvent
{
    public function getCommand():Dynamic;
    public function getCommandName():String;
    public function getDatabaseName():String;
    public function getOperationId():String;
    public function getRequestId():String;
    public function getServer():Server;
}