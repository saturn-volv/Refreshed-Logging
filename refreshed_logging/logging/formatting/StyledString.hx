package refreshed_logging.logging.formatting;

import refreshed_logging.logging.ansi.Ansi.AnsiColor24B;
import refreshed_logging.logging.ansi.Ansi.Attribute;

using StringTools;

abstract StyledString(String) from String {
    private static final ansiRegex = ~/`(0x)?[0-9A-F]{2}?/i;
    private static final hexColRegex = ~/`(0x)?[0-9A-F]{6}/i;
    private static final maxAnsiVal:Int = 0x6B;

    public function new(str:String) {
        this = str;
    }

    @:to public function toString():String {
        var str = this;
        var hexMatches:Array<String> = getMatches(hexColRegex, str);
        for (hex in hexMatches) {
            var col:AnsiColor24B = new Attribute(Std.parseInt((hex.contains('0x') ? "" : "0x") + hex.replace('`', '')));
            str = str.replace(hex, col);
        }
        var matches:Array<String> = getMatches(ansiRegex, str);
        for (match in matches) {
            str = str.replace(match, new Attribute(Std.parseInt((match.contains('0x') ? "" : "0x") + match.replace('`', ''))).toString());
        }

        return str;
    }

    function getMatches(ereg:EReg, input:String, ?index:Int = 0):Array<String> {
        var matches = [];
        while (ereg.match(input)) {
          matches.push(ereg.matched(index)); 
          input = ereg.matchedRight();
        }
        return matches;
      }
}