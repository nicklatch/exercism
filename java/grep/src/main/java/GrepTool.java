import java.io.BufferedReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;


class GrepTool {

    private static String pattern;
    private static List<String> flags;
    private static List<String> files;
    private static boolean isSingleton;
    private final StringBuilder grepFound = new StringBuilder();


    String grep(String pattern, List<String> flags, List<String> files) {
        GrepTool.pattern = flags.contains("-i") ? pattern.toLowerCase() : pattern;
        GrepTool.files = files;
        GrepTool.flags = flags;
        GrepTool.isSingleton = files.size() == 1;

        for (String file : files) {
            try (BufferedReader reader = Files.newBufferedReader(Paths.get(file))) {
                if (flags.contains("-l")) {
                    nameOnly();
                } else {
                    lineParsing(reader.lines().toList(), file);
                }
            } catch (Exception e) {
                throw new RuntimeException("Hoopla", e);
            }
        }
        return grepFound.toString().trim();
    }


    private void nameOnly() {
        for (String file : files) {
            try (BufferedReader reader = Files.newBufferedReader(Paths.get(file))) {
                List<String> fileLines = reader.lines().toList();

                if (grepFound.toString().contains(file)) {
                    continue;
                }

                for (String line : fileLines) {
                    if (line.contains(pattern)) {
                        grepFound.append(file).append("\n");
                        break;
                    }
                }
            } catch (Exception e) {
                throw new RuntimeException("Hoopla", e);
            }
        }

    }


    void lineParsing(List<String> fileLines, String file) {
        for (String line : fileLines) {
            var localLine = flags.contains("-i") ? line.toLowerCase() : line;
            var isInverted = flags.contains("-v") != (flags.contains("-x") ? localLine.equals(pattern) : localLine.contains(pattern));

            if (isInverted) {
                if (flags.contains("-n")) {
                    grepFound.append(prependLineNumber(line, fileLines.indexOf(line) + 1, file)).append("\n");
                } else {
                    grepFound.append(isSingleton ? "%s\n".formatted(line) : "%s:%s\n".formatted(file, line));
                }
            }
        }
    }


    private String prependLineNumber(String line, int lineNumber, String file) {
        return isSingleton ? "%d:%s".formatted(lineNumber, line) : "%s:%d:%s".formatted(file, lineNumber, line);
    }

}