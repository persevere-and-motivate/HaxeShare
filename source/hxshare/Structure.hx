package hxshare;
#if macro
import haxe.macro.Expr;

class Structure
{

    public var name:String;
    public var fields:Array<CField>;
    public var components:Map<String, Expr>;
    public var restRootURL:String;

    public function new()
    {
        fields = [];
        components = new Map<String, Expr>();
    }

}
#end