package php.mongodb.driver;

@:native("MongoDB\\Driver\\WriteConcernError")
extern class WriteConcernError
{
    public function getCode():Int;
    public function getInfo():Dynamic;
    public function getMessage():String;
}