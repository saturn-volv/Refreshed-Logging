package backend;

import refreshed_logging.logging.Log;

abstract KeyedLog(Log) from Log to Log {
    @:op(a.b)
    public function fieldRead(fieldName:String) {
        return this.getFromKey(fieldName).callback;
    }

    @:op([])
    public function keyGet(key:String) {
        return this.getFromKey(key).callback;
    }
    
    function get() {
        return Log.get();
    }
}