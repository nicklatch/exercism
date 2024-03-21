// Package grains implements functions for operations
// involving grains of rice on a checkerboard
package grains

import (
	"errors"
)

// Square returns the number of grains of rice on
// the given square. If a value larger than 64 or
// less than 1 is given, an error is returned
func Square(number int) (uint64, error) {
	if number < 1 || number > 64 {
		return 0, errors.New("index out of bounds")
	}
	return 1 << (number - 1), nil
}

// Total returns the total grains of
// rice on a 64 square checkerboard
func Total() uint64 {
	return 1<<64 - 1
}
