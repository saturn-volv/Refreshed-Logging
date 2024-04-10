package backend;

import backend.IKeyable;

import refreshed_logging.logging.Log;
import refreshed_logging.logging.level.LogLevel;

abstract KeyedLog(Log) from Log to Log {
    @:op([])
    public function keyGet(key:String) {
        return this.getFromKey(key).callback;
    }
    @:op(a.b)
    public function fieldRead(fieldName:String) {
        return this.getFromKey(fieldName).callback;
    }

    function get() {
        return Log.get();
    }
}