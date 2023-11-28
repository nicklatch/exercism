public class PopCount {

  public int eggCount(int number) {
    return (int) Integer.toBinaryString(number)
        .chars()
        .filter(char_ -> char_ == '1')
        .count();
  }
}
