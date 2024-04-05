package refreshed_logging;

import refreshed_logging.logging.Log;
import refreshed_logging.logging.Log.LogFunction;

class Logger {
    public static var info(get, never):LogFunction;
    static function get_info() {
        return Log.get().info;
    }
    public static var warning(get, never):LogFunction;
    static function get_warning() {
        return Log.get().warning;
    }
    public static var error(get, never):LogFunction;
    static function get_error() {
        return Log.get().error;
    }
    public static var debug(get, never):LogFunction;
    static function get_debug() {
        return Log.get().debug;
    }

}