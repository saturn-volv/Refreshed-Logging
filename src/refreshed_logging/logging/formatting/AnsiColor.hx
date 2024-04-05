package refreshed_logging.logging.formatting;

enum abstract AnsiColor(String) {
    var BLACK = '\033[0;30m';
    var RED = '\033[0;31m';
    var GREEN = '\033[0;32m';
    var YELLOW = '\033[0;33m';
    var BLUE = '\033[1;34m';
    var MAGENTA = '\033[1;35m';
    var CYAN = '\033[0;36m';
    var GREY = '\033[0;37m';
    var DEFAULT = '\033[0;37m';
    var WHITE = '\033[1;37m';
}