import java.util.stream.Collectors;

class Markdown {

  private final StringBuilder result = new StringBuilder();
  private boolean activeList = false;

  String parse(String markdown) {
    String[] lines = markdown.split("\n");

    parserLoop: for (String line : lines) {
      String currentLine = switch (line.trim().split("")[0]) {
        case "#" -> parseHeading(line);
        case "-" -> parseListItem(line);
        default -> parseParagraph(line);
      };

      switch (String.join("", currentLine.subSequence(0, 4))) {
        case "<li" -> {
          this.activeList = this.activeList == false ? true : false;
          this.result.append(this.activeList ? "<ul>" : "</ul>").append(currentLine);
        }
        default -> this.result.append(currentLine);
      }

      if (currentLine.matches("(<li>).*") && !this.activeList) {
        this.activeList = true;
        this.result.append("<ul>").append(currentLine);
      } else if (!currentLine.matches("(<li>).*") && this.activeList) {
        this.activeList = false;
        result.append("</ul>").append(currentLine);
      } else {
        result.append(currentLine);
      }

    }

    if (this.activeList) {
      result.append("</ul>");
    }

    return result.toString();
  }

  private String parseHeading(String markdown) {
    StringBuilder heading = new StringBuilder();

    var count = (int) markdown.chars().takeWhile(c -> c == '#').limit(6).count();

    if (count > 0) {
      return heading
          .append(String.format("<h" + count + ">")).append(markdown.substring(count + 1))
          .append(String.format("</h" + count + ">")).toString();
    } else {
      return null;
    }
  }

  private String parseListItem(String markdown) {
    return markdown.startsWith("*")
        ? "<li>" + parseSymbols(markdown.substring(2)) + "</li>"
        : null;
  }

  private String parseParagraph(String markdown) {
    return "<p>" + parseSymbols(markdown) + "</p>";
  }

  private String parseSymbols(String markdown) {
    return markdown.replaceAll("__(.+)__", "<strong>$1</strong>")
        .replaceAll("_(.+)_", "<em>$1</em>");
  }

}
