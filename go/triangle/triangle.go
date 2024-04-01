package triangle

type Kind int

const (
	NaT = iota // not a triangle
	Equ        // equilateral
	Iso        // isosceles
	Sca        // scalene
)

// KindFromSides returns a Kind coinciding with whether the
// triangle is equilateral, isosceles, scalene, or not a triangle
func KindFromSides(a, b, c float64) Kind {
	switch {
	case isTri(a, b, c) && a == b && b == c:
		return Kind(Equ)
	case isTri(a, b, c) && (a == b || a == c || b == c):
		return Kind(Iso)
	case isTri(a, b, c) && a != b && a != c && b != c:
		return Kind(Sca)
	default:
		return Kind(NaT)
	}
}

func isTri(a, b, c float64) bool {
	if a == 0 || b == 0 || c == 0 {
		return false
	}
	return a+b >= c && b+c >= a && a+c >= b
}
