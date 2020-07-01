package php.mongodb.driver;

@:native("MongoDB\\Driver\\WriteError")
extern class WriteError
{

    public function getCode():Int;
    public function getIndex():Int;
    public function getInfo():Dynamic;
    public function getMessage():String;

}