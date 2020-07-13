package php.cassandra;

@:native("Cassandra\\DefaultIndex")
extern class DefaultIndex implements Index
{
    public function name():String;
    public function kind():String;
    public function target():String;
    public function option(name:String):Value;
    public function options():Dynamic;
    public function className():String;
    public function isCustom():Bool;
    
}