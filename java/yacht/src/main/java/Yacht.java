import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

class Yacht {

    private final List<Integer> dice;
    private final YachtCategory yachtCategory;

    Yacht(int[] dice, YachtCategory yachtCategory) {
        this.yachtCategory = yachtCategory;
        this.dice = IntStream.of(dice).boxed().toList();
    }

    int score() {

        Set<Integer> diceSet = new HashSet<>(this.dice);

        return switch (this.yachtCategory) {
            case ONES, TWOS, THREES, FOURS, FIVES, SIXES ->
                sumCategory(this.dice, this.yachtCategory.ordinal());
            case YACHT ->
                diceSet.size() == 1 ? 50 : 0;
            case FULL_HOUSE ->
                isFullHouse(this.dice, diceSet) ? sumOfAllDice(this.dice) : 0;
            case CHOICE ->
                sumOfAllDice(this.dice);
            case LITTLE_STRAIGHT, BIG_STRAIGHT ->
                isStraight(diceSet, this.yachtCategory) ? 30 : 0;
            case FOUR_OF_A_KIND ->
                scoreFourOfAKind(this.dice);
        };
    }

    private static int sumCategory(List<Integer> dice, int target) {
        return dice
                .stream()
                .filter(die -> Objects.equals(die, target))
                .toList()
                .size() * target;
    }

    private static int sumOfAllDice(List<Integer> dice) {
        return dice
                .stream()
                .collect(Collectors.summingInt(Integer::intValue));
    }

    private static boolean isStraight(Set<Integer> diceSet, YachtCategory yachtCategory) {
        return diceSet.containsAll(Arrays.asList(1, 2, 3, 4, 5)) && yachtCategory == YachtCategory.LITTLE_STRAIGHT
                || diceSet.containsAll(Arrays.asList(2, 3, 4, 5, 6)) && yachtCategory == YachtCategory.BIG_STRAIGHT;
    }

    private static boolean isFullHouse(List<Integer> dice, Set<Integer> diceSet) {
        return !(diceSet.size() == 3
                || getOccurrenceCount(dice).containsValue(4)
                || getOccurrenceCount(dice).containsValue(5));
    }

    private static int scoreFourOfAKind(List<Integer> dice) {
        return getOccurrenceCount(dice)
                .entrySet()
                .stream()
                .filter(entry -> entry.getValue() >= 4)
                .map(entry -> entry.getKey() * 4)
                .findFirst()
                .orElse(0);
    }

    private static HashMap<Integer, Integer> getOccurrenceCount(List<Integer> dice) {
        return new HashSet<>(dice)
                .stream()
                .collect(Collectors
                        .toMap(Function.identity(),
                                v -> Collections.frequency(dice, v),
                                (o1, o2) -> o1,
                                HashMap::new));

    }

}
