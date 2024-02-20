package thefarm

import (
	"fmt"
)

// TODO: define the 'DivideFood' function
func DivideFood(fc FodderCalculator, cowQty int) (float64, error) {

	panic("")
}

// TODO: define the 'ValidateInputAndDivideFood' function
func ValidateInputAndDivideFood(fc FodderCalculator, cowQty int) (float64, error) {
	// check if cowQty > 0, if so call DivideFood with params
	// if lt 0, return error msg of "invalid number of cows"
	panic("")
}

type InvalidCowsError struct {
	cowQty int
	msg    string
}

func (e InvalidCowsError) Error() string {
	return fmt.Sprintf("%d cows are invalid: %s", e.cowQty, e.msg)
}

// TODO: define the 'ValidateNumberOfCows' function
func ValidateNumberOfCows(cowQty int) error {
	if cowQty < 0 {
		return &InvalidCowsError{cowQty: cowQty, msg: "invalid number of cows"}
	} else if cowQty == 0 {
		return &InvalidCowsError{cowQty: cowQty, msg: "now cows dont need food"}
	}
	return nil
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
//
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more
// functionality.
