package refreshed_logging.logging.formatting;

import refreshed_logging.logging.Log.LogFormat;
using StringTools;

class LogFormats {
    public static final haxeLogFormat:LogFormat = (input, ?infos, level) -> {
        var output:String = Std.string(input);
        if (infos == null) return output;

        var posInfos:String = '${infos.fileName}:${infos.lineNumber}';
        for (param in infos.customParams ?? []) 
            output += ', ${Std.string(param)}';

        return '$posInfos: $output';
    };

    public static final refreshedLogFormat:LogFormat = (input, ?infos, level) -> {
        var output:String = Std.string(input);
        var preface = level.getPrefix();
        if (infos == null) return '${preface.replace(":", " >>")}$output';

        var posInfos:String = '$preface ${infos.fileName} (line ${infos.lineNumber})';
        for (param in infos.customParams ?? [])
            output += ', ${Std.string(param)}';

        return '$posInfos >> $output';
    }
}