import java.util.Arrays;
import java.util.List;

class Scrabble {

  private final List<String> word;

  Scrabble(String word) {
    this.word = Arrays.asList(word.split(""));
  }

  int getScore() {
    return word
        .stream()
        .map(this::score)
        .reduce(0, Integer::sum);
  }

  int score(String letter) {
    return switch (letter.toUpperCase()) {
      case "" -> 0;
      case "D", "G" -> 2;
      case "B", "C", "M", "P" -> 3;
      case "F", "H", "V", "W", "Y" -> 4;
      case "K" -> 5;
      case "J", "X" -> 8;
      case "Q", "Z" -> 10;
      default -> 1;
    };
  }

}
