module [squareOfSum, sumOfSquares, differenceOfSquares]

squareOfSum : U64 -> U64
squareOfSum = \number ->
    List.range { start: At 1, end: At number }
    |> List.sum
    |> \x -> x * x

sumOfSquares : U64 -> U64
sumOfSquares = \number ->
    List.range { start: At 1, end: At number }
    |> List.walk 0 (\acc, x -> acc + (x * x))

differenceOfSquares : U64 -> U64
differenceOfSquares = \number ->
    squareOfSum number - sumOfSquares number
