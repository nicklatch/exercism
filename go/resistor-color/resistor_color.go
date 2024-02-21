package resistorcolor

import "slices"

type Color struct {
	name  string
	value int
}

// incomplete
var colors = [10]Color{
	Color{name: "Black", value: 0},
	Color{name: "Brown", value: 1},
	Color{name: "Red", value: 2},
	Color{name: "Orange", value: 3},
	Color{name: "Yellow", value: 4},
	Color{name: "Green", value: 5},
	Color{name: "Blue", value: 6},
	Color{name: "Violet", value: 7},
	Color{name: "Grey", value: 8},
	Color{name: "White", value: 9},
}

// Colors returns the list of all colors.
func Colors() []string {
	var colorList []string
	slices.Grow(colorList, 10)
	for _, color := range colors {
		colorList = append(colorList, color.name)
	}
	return colorList
}

// ColorCode returns the resistance value of the given color.
func ColorCode(color string) int {

}
