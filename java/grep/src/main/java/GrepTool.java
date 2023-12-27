import java.io.BufferedReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;


class GrepTool {
    public String grep(String pattern, List<String> flags, List<String> files) {
        final StringBuilder grepFound = new StringBuilder();
        String localPattern = flags.contains("-i") ? pattern.toLowerCase() : pattern;
        boolean isSingleton = files.size() == 1;

        if (flags.contains("-l")) {
            nameOnly(files, localPattern).forEach(grepFound::append);
        } else {
            for (String file : files) {
                try (BufferedReader reader = Files.newBufferedReader(Paths.get(file))) {
                    lineParsing(reader.lines().toList(), file, localPattern, flags, isSingleton).forEach(grepFound::append);
                } catch (Exception e) {
                    throw new RuntimeException("Hoopla", e);
                }
            }
        }

        return grepFound.toString().trim();

    }


    private List<String> nameOnly(List<String> files, String pattern) {
        List<String> filteredFileNames = new ArrayList<>();

        for (String file : files) {
            try (BufferedReader reader = Files.newBufferedReader(Paths.get(file))) {
                List<String> fileLines = reader.lines().toList();

                if (filteredFileNames.contains(file)) {
                    continue;
                }

                for (String line : fileLines) {
                    if (line.contains(pattern)) {
                        filteredFileNames.add(file + "\n");
                        break;
                    }
                }
            } catch (Exception e) {
                throw new RuntimeException("Hoopla", e);
            }
        }
        return filteredFileNames;

    }


    private List<String> lineParsing(List<String> fileLines, String file, String pattern, List<String> flags, Boolean isSingleton) {
        List<String> filteredLines = new ArrayList<>();

        for (String line : fileLines) {
            String localLine = flags.contains("-i") ? line.toLowerCase() : line;
            boolean isInverted = flags.contains("-v") != (flags.contains("-x") ? localLine.equals(pattern) : localLine.contains(pattern));

            if (isInverted) {
                if (flags.contains("-n")) {
                    filteredLines.add(prependLineNumber(line, fileLines.indexOf(line) + 1, file, isSingleton) + "\n");
                } else {
                    filteredLines.add(isSingleton ? "%s\n".formatted(line) : "%s:%s\n".formatted(file, line));
                }
            }
        }
        return filteredLines;
    }


    private String prependLineNumber(String line, int lineNumber, String file, boolean isSingleton) {
        return isSingleton ? "%d:%s".formatted(lineNumber, line) : "%s:%d:%s".formatted(file, lineNumber, line);
    }

}