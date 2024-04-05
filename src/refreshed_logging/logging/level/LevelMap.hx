package refreshed_logging.logging.level;

import refreshed_logging.logging.formatting.AnsiColor;
import haxe.ds.StringMap;

class LevelMap extends StringMap<LogLevel> {
    public override function get(key:String):Null<LogLevel> {
        key = key.toLowerCase();
        if (!this.exists(key))
            this.set(key, new LogLevel(key, AnsiColor.GREY));
        return super.get(key);
    }
}