package php.mongodb.driver.monitoring;

interface CommandSubscriber extends Subscriber
{
    function commandFailed(event:CommandFailedEvent):Void;
    function commandStarted(event:CommandStartedEvent):Void;
    function commandSucceeded(event:CommandSucceededEvent):Void;
}