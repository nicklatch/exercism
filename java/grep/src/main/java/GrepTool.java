import java.io.BufferedReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;


class GrepTool {

    private final StringBuilder grepFound = new StringBuilder();


    public String grep(String pattern, List<String> flags, List<String> files) {
        String localPattern = flags.contains("-i") ? pattern.toLowerCase() : pattern;
        boolean isSingleton = files.size() == 1;

        if (flags.contains("-l")) {
            nameOnly(files, grepFound, localPattern);
        } else {
            for (String file : files) {
                try (BufferedReader reader = Files.newBufferedReader(Paths.get(file))) {
                    lineParsing(reader.lines().toList(), file, localPattern, flags, isSingleton);
                } catch (Exception e) {
                    throw new RuntimeException("Hoopla", e);
                }
            }
        }

        return grepFound.toString().trim();

    }


    private void nameOnly(List<String> files, StringBuilder grepFound, String pattern) {
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


    private void lineParsing(List<String> fileLines, String file, String pattern, List<String> flags, Boolean isSingleton) {
        for (String line : fileLines) {
            var localLine = flags.contains("-i") ? line.toLowerCase() : line;
            var isInverted = flags.contains("-v") != (flags.contains("-x") ? localLine.equals(pattern) : localLine.contains(pattern));

            if (isInverted) {
                if (flags.contains("-n")) {
                    grepFound.append(prependLineNumber(line, fileLines.indexOf(line) + 1, file, isSingleton)).append("\n");
                } else {
                    grepFound.append(isSingleton ? "%s\n".formatted(line) : "%s:%s\n".formatted(file, line));
                }
            }
        }
    }


    private String prependLineNumber(String line, int lineNumber, String file, boolean isSingleton) {
        return isSingleton ? "%d:%s".formatted(lineNumber, line) : "%s:%d:%s".formatted(file, lineNumber, line);
    }

}