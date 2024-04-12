package refreshed_logging.logging.ansi;

@:forward(push)
abstract AnsiStyle(Array<Attribute>) from Array<Attribute> {
    public static final ESCAPE:String = '\033';
    inline public function new(attributeArr:Array<Attribute>) {
        this = attributeArr;
        this.sort((a, b) -> {return a.asInt() > b.asInt() ? b : a;});
    }

    public function toString() {
        var output:String = '[';
        for (i => attr in this) {
            if (i > 0) output += ';';
            output += attr.asInt();
        }
        return '${ESCAPE}${output}m';
    }
}

abstract Attribute(Int) from Int to Int {
    inline public function new(i:Int){ 
        this = i;
    }

    public function asInt():Int {
        return cast(this, Int);
    }

    public function toString(): String {
        return '${AnsiStyle.ESCAPE}[${this}m';
    }
}
abstract AnsiColor24B(Int) from Int to Int{
    public var red(get, never):Int;
    public var green(get, never):Int;
    public var blue(get, never):Int;

    function get_red():Int {
        return (Std.int(this) >> 16) & 0xFF;
    }
    function get_green():Int {
        return (Std.int(this) >> 8) & 0xFF;
    }
    function get_blue():Int {
        return Std.int(this) & 0xFF;
    }

    public inline function new(i:Int) {
        this = i;
    }

    public function toString() {
        return '${AnsiStyle.ESCAPE}[38;2;${red};${green};${blue}m';
    }
}
enum abstract Attributes(Attribute) from Attribute to Attribute {
    var Reset = 0;

    var Bold = 1;
    var Dim = 2;
    var Italic = 3;
    var Underline = 4;
    var SlowBlink = 5;
    var FastBlink = 6;
    var Reverse = 7;
    var Hidden = 8;
    var Strikethrough = 9;

    var ResetFont = 10;
    // Fonts = 11-19;
        // Not yet implemented :D

    // Fraktur = 20;
    #if !modern_terminal
    var NoBold = 21;
    #else
    var DoubleUnderline = 21; 
    #end
    var NoIntensity = 22;
    var NoItalic = 23;
    var NoUnderline = 24;
    var NoBlink = 25;
    var ProportionalSpacing = 26;
    var NoReverse = 27;
    var NoConceal = 28;
    var NoStrikethrough = 29;
    
    // 4-bit FG Colors
    var Black = 30;
    var Red = 31;
    var Green = 32;
    var Yellow = 33;
    var Blue = 34;
    var Magenta = 35;
    var Cyan = 36;
    var White = 37;

    var SetForeground = 38;
    var ResetForeground = 39;
    
    // 4-bit BG Colors
    var BlackBG = 40;
    var RedBG = 41;
    var GreenBG = 42;
    var YellowBG = 43;
    var BlueBG = 44;
    var MagentaBG = 45;
    var CyanBG = 46;
    var WhiteBG = 47;
    
    var SetBackground = 48;
    var ResetBackrgoudn = 49;
    
    var NoProportionalSpacing = 50;

    var Frame = 51;
    var Encircle = 52;
    var Overline = 53;
    var NoFrame = 54;
    var NoOverline = 55;
    
    var SetUnderline = 58;
    var ResetUnderline = 59;
    
    // 4-Bit Bright FG Colors
    var BrightBlack = 90;
    var BrightRed = 91;
    var BrightGreen = 92;
    var BrightYellow = 93;
    var BrightBlue = 94;
    var BrightMagenta = 95;
    var BrightCyan = 96;
    var BrightWhite = 97;
    
    // 4-Bit Bright BG Colors
    var BrightBlackBG = 100;
    var BrightRedBG = 101;
    var BrightGreenBG = 102;
    var BrightYellowBG = 103;
    var BrightBlueBG = 104;
    var BrightMagentaBG = 105;
    var BrightCyanBG = 106;
    var BrightWhiteBG = 107;

    public function toString() {
        return this.toString();
    }
}

class Ansi {
    public static final CLEAR_CONSOLE:String = '\033[2J';
}