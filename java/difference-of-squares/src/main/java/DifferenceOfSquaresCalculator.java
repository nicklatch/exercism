import java.util.stream.IntStream;

class DifferenceOfSquaresCalculator {

    int computeSquareOfSumTo(int input) {
        int sum = IntStream.range(1, input + 1).sum();

        return (int) Math.pow(sum, 2);
    }

    int computeSumOfSquaresTo(int input) {
        return IntStream
                .range(0, input + 1)
                .map(num -> (int) Math.pow(num, 2))
                .sum();
    }

    int computeDifferenceOfSquares(int input) {
        return computeSquareOfSumTo(input) - computeSumOfSquaresTo(input);
    }


}
