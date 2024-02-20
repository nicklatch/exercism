package thefarm

import (
	"errors"
	"fmt"
)

type InvalidCowsError struct {
	cowQty int
	msg    string
}

// Error returns a formated error message from an InvalidCowsError
func (e InvalidCowsError) Error() string {
	return fmt.Sprintf("%d cows are invalid: %s", e.cowQty, e.msg)
}

// DivideFood accepts a FodderCalculator and int representing the quantity
// of cows and returns the diveded food amount and an err (if available, else nil)
func DivideFood(fc FodderCalculator, cowQty int) (float64, error) {
	totalFodder, err := fc.FodderAmount(cowQty)
	if err != nil {
		return 0.0, err
	}

	fatFac, err := fc.FatteningFactor()
	if err != nil {
		return 0.0, err
	}
	return totalFodder / float64(cowQty) * fatFac, nil
}

// ValidateInputAndDivideFood uses the ValidateNumberOfCows func to either return an
// error or return the value of a call to DivideFood with its given params
func ValidateInputAndDivideFood(fc FodderCalculator, cowQty int) (float64, error) {
	err := ValidateNumberOfCows(cowQty)
	if err != nil {
		return 0.0, errors.New("invalid number of cows")
	}
	return DivideFood(fc, cowQty)
}

// ValidateNumberOfCows returns an error messagme based on the cowQty param, or nil
// if cowQty is valid
func ValidateNumberOfCows(cowQty int) error {
	if cowQty < 0 {
		return &InvalidCowsError{cowQty: cowQty, msg: "there are no negative cows"}
	} else if cowQty == 0 {
		return &InvalidCowsError{cowQty: cowQty, msg: "no cows don't need food"}
	}
	return nil
}
