import java.util.Arrays;
import java.util.stream.Collectors;

class ArmstrongNumbers {

    boolean isArmstrongNumber(int numberToCheck) {
        String strNum = String.valueOf(numberToCheck);
        int strNumLength = strNum.length();

        return numberToCheck == Arrays
                .asList(strNum.split(""))
                .stream()
                .map(s -> Math.pow(Double.valueOf(s), strNumLength))
                .collect(Collectors.summingInt(Double::intValue));
    }
}
