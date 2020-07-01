package php.mongodb.driver;

@:native("MongoDB\\Driver\\Cursor")
extern class Cursor implements CursorInterface
{

    public function new();
    public function getId():CursorId;
    public function getServer():Server;
    public function isDead():Bool;
    public function setTypeMap(typemap:Dynamic):Void;
    public function toArray():Dynamic;

}