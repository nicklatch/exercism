import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

class ParallelLetterFrequency {
    private final List<String> initial;

    ParallelLetterFrequency(String[] texts) {
        this.initial = List.of(texts);
    }

    Map<Character, Integer> countLetters() {
        return String.join(" ", initial)
                     .chars()
                     .parallel()
                     .mapToObj(c -> (char) c)
                     .filter(Character::isLetter)
                     .collect(Collectors.groupingBy(Character::toLowerCase, Collectors.summingInt(c -> 1)));
    }
}
