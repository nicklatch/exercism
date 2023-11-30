class CalculatorConundrum {

  public String calculate(int operand1, int operand2, String operation) {
    try {
      int result = switch (operation) {
        case null -> throw new IllegalArgumentException("Operation cannot be null");
        case "" -> throw new IllegalArgumentException("Operation cannot be empty");
        case "+" -> operand1 + operand2;
        case "/" -> operand1 / operand2;
        case "*" -> operand1 * operand2;
        default -> throw new IllegalOperationException(
            String.format("Operation '%s' does not exist", operation));
      };
      return String.format("%d %s %d = %d", operand1, operation, operand2, result);
    } catch (ArithmeticException a) {
      throw new IllegalOperationException("Division by zero is not allowed", a);
    }
  }
}


