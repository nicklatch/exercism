package diffsquares

// SquareOfSum accepts an int and returns the square of the
// sum of the first n natural numbers
func SquareOfSum(n int) int {
	// n >> 1 == n / 2
	sum := (1 + n) * n >> 1
	return sum * sum
}

// SumOfSquares accepts an int and returns the sum of the first
// n integers squared
func SumOfSquares(n int) int {
	return (1 + n) * (n<<1 + 1) * n / 6
}

// Difference returns the differences between SquareOfSum
// and SumOfSquares
func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}
