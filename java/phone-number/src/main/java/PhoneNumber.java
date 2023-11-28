//This solution is without comments for easier readability, previous has comments
class PhoneNumber {

  private final String groomedNumber;

  PhoneNumber(String numberString) {
    this.groomedNumber = cleanNumberString(numberString);
  }

  String getNumber() {
    return groomedNumber;
  }

  private String cleanNumberString(String numberString) {
    StringBuilder cleaned = new StringBuilder();

    preCheck(numberString)
        .chars()
        .filter(Character::isDigit)
        .forEach(c -> cleaned.append((char) c));

    return validateNumber(lengthCheck(cleaned).toString());
  }

  private String preCheck(String numberString) {
    if (numberString.length() < 10) {
      throw new IllegalArgumentException("incorrect number of digits");
    } else if (numberString.matches(".*[a-zA-Z]+.*")) {
      throw new IllegalArgumentException("letters not permitted");
    } else if (numberString.matches(".*[!?;:\"']+.*")) {
      throw new IllegalArgumentException("punctuations not permitted");
    }

    return numberString;
  }


  private StringBuilder lengthCheck(StringBuilder cleanedString) {
    if (cleanedString.length() > 11) {
      throw new IllegalArgumentException("more than 11 digits");
    } else if (cleanedString.length() < 10) {
      throw new IllegalArgumentException("incorrect number of digits");
    }

    return cleanedString;
  }

  private String validateNumber(String phoneNumber) {
    boolean numLengthIs11 = phoneNumber.length() == 11;

    if (numLengthIs11 && phoneNumber.charAt(0) != '1') {
      throw new IllegalArgumentException("11 digits must start with 1");
    } else if (phoneNumber.charAt(numLengthIs11 ? 1 : 0) == '0') {
      throw new IllegalArgumentException("area code cannot start with zero");
    } else if (phoneNumber.charAt(numLengthIs11 ? 1 : 0) == '1') {
      throw new IllegalArgumentException("area code cannot start with one");
    } else if (phoneNumber.charAt(numLengthIs11 ? 4 : 3) == '0') {
      throw new IllegalArgumentException("exchange code cannot start with zero");
    } else if (phoneNumber.charAt(numLengthIs11 ? 4 : 3) == '1') {
      throw new IllegalArgumentException("exchange code cannot start with one");
    }

    return numLengthIs11 ? phoneNumber.substring(1) : phoneNumber;
  }
}