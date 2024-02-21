package resistorcolor

import (
	"slices"
	"strings"
)

// incomplete
var colors = map[string]int{
	"black":  0,
	"brown":  1,
	"red":    2,
	"orange": 3,
	"yellow": 4,
	"green":  5,
	"blue":   6,
	"violet": 7,
	"grey":   8,
	"white":  9,
}

// Colors returns the list of all colors.
func Colors() []string {
	var colorList []string
	slices.Grow(colorList, 10)
	for name, _ := range colors {
		colorList = append(colorList, name)
	}
	return colorList
}

// ColorCode returns the resistance value of the given color.
func ColorCode(color string) int {
	return colors[strings.ToLower(color)]
}
