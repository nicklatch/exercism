public class LogLine {


    private final String cleanedLevel;
    private final String cleanedMessage;


    public LogLine(String logLine) {
        String[] splitLog = logLine.split(": ");
        this.cleanedLevel = splitLog[0].replace("[", "").replace("]", "");
        this.cleanedMessage = splitLog[1].trim();
    }

    public LogLevel getLogLevel() {
        return switch (cleanedLevel) {
            case "TRC" -> LogLevel.TRACE;
            case "DBG" -> LogLevel.DEBUG;
            case "INF" -> LogLevel.INFO;
            case "WRN" -> LogLevel.WARNING;
            case "ERR" -> LogLevel.ERROR;
            case "FTL" -> LogLevel.FATAL;
            default -> LogLevel.UNKNOWN;
        };
    }

    public String getOutputForShortLog() {
        return switch (getLogLevel()) {
            case UNKNOWN -> "0:" + cleanedMessage;
            case TRACE -> "1:" + cleanedMessage;
            case DEBUG -> "2:" + cleanedMessage;
            case INFO -> "4:" + cleanedMessage;
            case WARNING -> "5:" + cleanedMessage;
            case ERROR -> "6:" + cleanedMessage;
            case FATAL -> "42:" + cleanedMessage;
        };
    }
}
