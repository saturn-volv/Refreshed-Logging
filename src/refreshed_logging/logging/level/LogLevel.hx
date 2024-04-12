package refreshed_logging.logging.level;

import refreshed_logging.logging.Log;
import refreshed_logging.logging.Log.LogFunction;
import refreshed_logging.logging.formatting.AnsiColor;
import refreshed_logging.logging.ansi.Ansi.AnsiStyle;

import haxe.PosInfos;

using StringTools;

class LogLevel {
    public static final levelMap:LevelMap = new LevelMap();
    public final name:String;
    public final color:AnsiStyle;

    public final callback:LogFunction;

    public function new(name:String, ?color:AnsiStyle, ?callback:LogFunction) {
        this.name = name;
        this.color = color ?? AnsiColor.GREY;
        this.callback = callback ?? (v, ?infos) -> customTrace(v, infos, name);
        levelMap.set(name, this);
    }

    public function getPrefix() {
        if (name.length > 0)
            return '$color[${name.toUpperCase()}]:';
        return '$color';
    }

    public static function customTrace(v:Dynamic, ?infos:Null<PosInfos>, ?accessName:String) {
        print(v, infos, accessName);
    }
    
    private static function debug(v:Dynamic, ?infos:Null<PosInfos>) {
        print(v, infos, "debug");
    }
    
    private static function info(v:Dynamic, ?infos:Null<PosInfos>) {
        print(v, infos, "info");
    }
    
    private static function warning(v:Dynamic, ?infos:Null<PosInfos>) {
        print(v, infos, "warning");
    }
    
    private static function error(v:Dynamic, ?infos:Null<PosInfos>) {
        print(v, infos, "error");
    }
    
    private static function trace(v:Dynamic, ?infos:Null<PosInfos>) {
        warning("Please use `Logger.info` instead of `trace`", null);
        print(v, infos, "default");
    }
    private static function print(v:Dynamic, ?infos:Null<PosInfos>, levelName:String) {
        var level = levelMap.get(levelName);
        var str = Logger.selectedLogFormat(v, infos, level) + AnsiColor.DEFAULT;

        #if js
        if (js.Syntax.typeof(untyped console) != "undefined" && (untyped console).log != null) 
            (untyped console).log(str);
        #elseif lua
        untyped __define_feature__("use._hx_print", _hx_print(str));
        #elseif sys
        Sys.println(str);
        #else
        throw new haxe.exceptions.NotImplementedException();
        #end
    }
}