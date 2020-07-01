package php.mongodb.driver;

import php.Traversable;

interface CursorInterface extends Traversable
{
    function getId():CursorId;
    function getServer():Server;
    function isDead():Bool;
    function setTypeMap(typemap:Dynamic):Void;
    function toArray():Dynamic;
}