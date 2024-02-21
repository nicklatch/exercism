package leap

// IsLeapYear accepts a year and returns a bool
// representing if its a leap year or not
func IsLeapYear(year int) bool {
	return year%4 == 0 && (year%100 != 0 || year%400 == 0)
}
