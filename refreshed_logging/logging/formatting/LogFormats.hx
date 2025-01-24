package refreshed_logging.logging.formatting;

import refreshed_logging.logging.Log.LogFormat;
using StringTools;

class LogFormats {
    public static final haxeLogFormat:LogFormat = (input, ?infos, level) -> {
        var output:StyledString = new StyledString(Std.string(input));
        if (infos == null) return output;

        var posInfos:StyledString = '${infos.fileName}:${infos.lineNumber}';
        for (param in infos.customParams ?? []) 
            output += ', ${Std.string(param)}';

        return '$posInfos: $output';
    };

    public static final refreshedLogFormat:LogFormat = (input, ?infos, level) -> {
        var output:StyledString = new StyledString(Std.string(input));
        var preface = level.getPrefix();
        if (infos == null) return '${preface.replace(":", " >>")}$output';

        var posInfos:StyledString = '$preface ${infos.fileName} (line ${infos.lineNumber})';
        for (param in infos.customParams ?? [])
            output += ', ${Std.string(param)}';

        return '$posInfos >> $output';
    }
}