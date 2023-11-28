class Markdown {

  private final StringBuilder result = new StringBuilder();
  private boolean activeList = false;

  String parse(String markdown) {
    String[] lines = markdown.split("\n");

    for (String line : lines) {
      String theLine = parseHeader(line);

      if (theLine == null) {
        theLine = parseListItem(line);
      }

      if (theLine == null) {
        theLine = parseParagraph(line);
      }

      if (theLine.matches("(<li>).*") && !this.activeList) {
        this.activeList = true;
        this.result.append("<ul>").append(theLine);
      } else if (!theLine.matches("(<li>).*") && this.activeList) {
        this.activeList = false;
        result.append("</ul>").append(theLine);
      } else {
        result.append(theLine);
      }

    }

    if (this.activeList) {
      result.append("</ul>");
    }

    return result.toString();
  }

  private String parseHeader(String markdown) {
    StringBuilder header = new StringBuilder();

    int count = (int) markdown.chars().takeWhile(c -> c == '#').count();

    if (count > 0) {
      return header.append(String.format("<h" + count + ">")).append(markdown.substring(count + 1))
          .append(String.format("</h" + count + ">")).toString();
    } else {
      return null;
    }
  }

  private String parseListItem(String markdown) {
    return markdown.startsWith("*") ? "<li>" + parseSomeSymbols(markdown.substring(2)) + "</li>"
        : null;
  }

  private String parseParagraph(String markdown) {
    return "<p>" + parseSomeSymbols(markdown) + "</p>";
  }

  private String parseSomeSymbols(String markdown) {
    return markdown.replaceAll("__(.+)__", "<strong>$1</strong>")
        .replaceAll("_(.+)_", "<em>$1</em>");
  }

}
