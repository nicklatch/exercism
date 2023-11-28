import java.util.stream.IntStream;

public class SquareRoot {

  public int squareRoot(int radicand) {
    return IntStream.range(1, radicand + 1)
        .filter(i -> i * i == radicand)
        .findFirst()
        .orElse(0);
  }
}
