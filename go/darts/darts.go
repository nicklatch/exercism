package darts

import "math"

func Score(x, y float64) int {
	hypot := math.Hypot(x, y)
	switch {
	case hypot <= 1.0:
		return 10
	case hypot <= 5.0:
		return 5
	case hypot <= 10.0:
		return 1
	default:
		return 0
	}
}
