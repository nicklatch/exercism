package space

// Planet is a wrapper type over a string represent a planets' name
type Planet string

// Age accepts an age in seconds (float64) and returns their age on
// the given Planet. If an invalid Planet is given, it returns -1.00
func Age(seconds float64, planet Planet) float64 {
	switch planet {
	case "Mercury":
		return (seconds / 31557600) / 0.2408467
	case "Venus":
		return (seconds / 31557600) / 0.61519726
	case "Earth":
		return seconds / 31557600
	case "Mars":
		return (seconds / 31557600) / 1.8808158
	case "Jupiter":
		return (seconds / 31557600) / 11.862615
	case "Saturn":
		return (seconds / 31557600) / 29.447498
	case "Uranus":
		return (seconds / 31557600) / 84.016846
	case "Neptune":
		return (seconds / 31557600) / 164.79132
	default:
		return -1.00
	}
}
