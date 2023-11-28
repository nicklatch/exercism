import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

class RomanNumerals {

  private final String romanNumeral;
  private static final int[] values = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
  private static final String[] romanLetters = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V",
      "IV", "I"};


  RomanNumerals(int number) {
    this.romanNumeral = convertToRoman(number);
  }

  String getRomanNumeral() {
    return this.romanNumeral;
  }

  private String convertToRoman(int number) {
    StringBuilder romanBuilder = new StringBuilder();

    for (int i = 0; i < values.length; i++) {
      while (number >= values[i]) {
        number = number - values[i];
        romanBuilder.append(romanLetters[i]);
      }
    }

    return romanBuilder.toString();
  }
}
