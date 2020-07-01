package php.mongodb.bson;

interface TimestampInterface
{
    function getIncrement():Int;
    function getTimestamp():Int;
    function __toString():String;
}