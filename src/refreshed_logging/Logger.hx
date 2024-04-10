package refreshed_logging;

import backend.KeyedLog;
import refreshed_logging.logging.level.LogLevel;
import refreshed_logging.logging.formatting.LogFormats;
import refreshed_logging.logging.Log;
import refreshed_logging.logging.Log.LogFunction;

@:access(refreshed_logging.logging.level.LogLevel)
@:access(refreshed_logging.logging.Log)
class Logger {
    private static var logger(get, never):backend.KeyedLog;
    static function get_logger() {
        return Log.get();
    }
    public static var info(get, never):LogFunction;
    static function get_info() {
        return logger.info;
    }
    public static var warning(get, never):LogFunction;
    static function get_warning() {
        return logger.warning;
    }
    public static var error(get, never):LogFunction;
    static function get_error() {
        return logger.error;
    }
    public static var debug(get, never):LogFunction;
    static function get_debug() {
        return logger.debug;
    }

    public static var selectedLogFormat:LogFormat = LogFormats.haxeLogFormat;
    public static var selectedLogFunction(default, set):LogFunction = LogLevel.trace;
    static function set_selectedLogFunction(func:LogFunction) {
        selectedLogFunction = func;
        Log.instance.defaultLogLevel = selectedLogFunction;
        return selectedLogFunction;
    }

}