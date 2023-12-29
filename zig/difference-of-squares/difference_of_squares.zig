pub fn squareOfSum(number: usize) usize {
    var i: usize= 0;
    var sum: usize = 0;

    while (i < number + 1) {
        sum += i;
        i += 1;
    }

    return sum * sum;
}

pub fn sumOfSquares(number: usize) usize {
    var i: usize = 0;
    var sum: usize = 0;

    while (i < number + 1) {
        sum += (i * i);
        i += 1;
    }

    return sum;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
