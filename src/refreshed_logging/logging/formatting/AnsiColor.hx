package refreshed_logging.logging.formatting;

import refreshed_logging.logging.ansi.Ansi.AnsiStyle;

class AnsiColor {
    public static final BLACK = new AnsiStyle([0, 30]);
    public static final RED = new AnsiStyle([0, 31]);
    public static final GREEN = new AnsiStyle([0, 32]);
    public static final YELLOW = new AnsiStyle([0, 33]);
    public static final BLUE = new AnsiStyle([1, 34]);
    public static final MAGENTA = new AnsiStyle([1, 35]);
    public static final CYAN = new AnsiStyle([0, 36]);
    public static final GREY = new AnsiStyle([0, 37]);
    public static final DEFAULT = new AnsiStyle([0, 37]);
    public static final WHITE = new AnsiStyle([1, 37]);
}