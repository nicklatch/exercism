import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class PangramChecker {
    public boolean isPangram(String input) {
        Set<Character> possiblePangram = new HashSet<>();
        input
            .toLowerCase()
            .chars()
            .filter(Character::isLetter)
            .forEach(c -> possiblePangram.add((char) c));

        return possiblePangram.size() == 26;
    }

}
