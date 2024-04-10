package refreshed_logging.logging;

import backend.KeyedLog;
import backend.IKeyable;
import haxe.PosInfos;
import refreshed_logging.logging.formatting.AnsiColor;
import refreshed_logging.logging.level.LogLevel;

typedef LogFormat = (Dynamic, ?Null<PosInfos>, LogLevel) -> String;
typedef LogFunction = (Dynamic, ?Null<PosInfos>) -> Void;

@:access(refreshed_logging.logging.level.LogLevel)
final class Log implements IKeyable<LogLevel> {
    private static var DEBUG_LEVEL:LogLevel;
    private static var INFO_LEVEL:LogLevel;
    private static var WARNING_LEVEL:LogLevel;
    private static var ERROR_LEVEL:LogLevel;

    private static var instance(get, default):Log;
    private static function get_instance() : Log {
        return instance ?? new Log();
    }
    private function new() {
        DEBUG_LEVEL = new LogLevel("debug", AnsiColor.DEFAULT, LogLevel.debug);
        INFO_LEVEL = new LogLevel("info", AnsiColor.WHITE, LogLevel.info);
        WARNING_LEVEL = new LogLevel("warning", AnsiColor.YELLOW, LogLevel.warning);
        ERROR_LEVEL = new LogLevel("error", AnsiColor.RED, LogLevel.error);

        instance = this;
        updateLog();
    }
    public static function get() : KeyedLog {
        return instance;
    }

    private var defaultLogLevel(default, set):Null<LogFunction>;
    function set_defaultLogLevel(func:Null<LogFunction>) {
        this.defaultLogLevel = func;
        updateLog();
        return this.defaultLogLevel;
    }
    private static function updateLog() : Void {
        haxe.Log.trace = instance.defaultLogLevel ?? LogLevel.trace;
    }

    public function getFromKey(key:String) {
        return LogLevel.levelMap.get(key);
    }
}