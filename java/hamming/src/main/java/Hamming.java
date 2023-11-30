import java.util.Objects;

public class Hamming {

  private final String leftStrand, rightStrand;

  public Hamming(String leftStrand, String rightStrand) {

    if (leftStrand.length() != rightStrand.length()) {
      throw new IllegalArgumentException("strands must be of equal length");
    }

    this.leftStrand = leftStrand;
    this.rightStrand = rightStrand;
  }

  public int getHammingDistance() throws IllegalArgumentException {

    if (leftStrand.equals(rightStrand)) {
      return 0;
    }

    int hammingDistance = 0;
    String[] splitLeft = leftStrand.split("");
    String[] splitRight = rightStrand.split("");

    for (int i = 0; i < splitRight.length; i++) {
      if (!Objects.equals(splitRight[i], splitLeft[i])) {
        hammingDistance++;
      }
    }

    return hammingDistance;
  }
}
