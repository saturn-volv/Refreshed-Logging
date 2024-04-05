# Refreshed-Logging
 A cool and hip new way to log to your console with haxe! 

 All the kids are logging their work this way, so you should too!

 ## How to use it?
  Well there's this handy feature called "wildcard" importing, where you can use a `.*` at the end of an import to include all static functions and variables from a class. We can use this with our `Logger` class to have it feel like we never even moved from the classic trace statement. 

  At either the top of your class, or using an `import.hx` file; include the following line:
  ```haxe
import refreshed_logging.Logger.*;
  ```
 Now you too can use the hip new log methods without needing all that instance getting and other junk of the `Log` class (which has been kept public so you can still mess with, I want my users to have complete creative freedom with this).

 ### Log Levels
  Each native log function has a parent `LogLevel` instance. (You can find examples of how to create these in [`Log`](https://github.com/saturn-volv/Refreshed-Logging/blob/main/src/refreshed_logging/logging/Log.hx))

  All native log level functions can actually be overriden, as they are not final nor are they private. So you can create your own instances of these log levels, either by overriding the `LogFunction` instance in `Log` or you can override them by just creating new log levels with the same name. When creating a log level, you can choose to include your own callback, so that's your time to shine and create your own fancy new logging methods!

  You can create your own log levels, and can change the display name, or even the color of what is logged! To create your own, just follow this handy example:
  ```haxe
var customLogLevel = new LogLevel("custom_loglevel", AnsiColors.CYAN);
  ```
  Thats right! It's just *that* simple, now you can log to the console with ur very own color and name! Now if you want to log using it, just create ur own function like so:
  ```haxe
    public static function customLog(v:Dynamic, ?infos:Null<PosInfos>) {
        customLogLevel.callback(v, infos);
    }    
        // Or if you aren't in the same scope as your log level, there is a permanent instance saved always:
        LogLevel.levelMap.get("custom_loglevel").callback(v, infos);
  ```
 ### Planned Features
 I'm planning on adding an option to change how the output is formatted, just so your project can be unique to you! Might even include some very basic examples you can change the format to, so you don't have to figure it all out for yourself every time.
