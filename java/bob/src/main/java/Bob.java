class Bob {

  String hey(String input) {

    if (input.isBlank()) {
      return "Fine. Be that way!";
    } else if (atLeastOneAlpha(input) && input.toUpperCase().equals(input)
        && input.charAt(input.length() - 1) == '?') {
      return "Calm down, I know what I'm doing!";
    } else if (input.trim().charAt(input.trim().length() - 1) == '?') {
      return "Sure.";
    } else if (atLeastOneAlpha(input) && input.toUpperCase().equals(input)) {
      return "Whoa, chill out!";
    }

    return "Whatever.";
  }

  boolean atLeastOneAlpha(String input) {
    return input.matches(".*[a-zA-Z]+.*");
  }
}