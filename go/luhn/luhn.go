package luhn

import "strings"

// Valid accepts an id as a string and determines
// whether the digits in id create a valid luhn code
func Valid(id string) bool {
	id = strings.ReplaceAll(id, " ", "")
	if len(id) <= 1 {
		return false
	}

	// dblIfEven is a counter that is incremented after each loop.
	// If it's odd, numVal (numeric value of its string rep) is doubled
	var checksum, idx, dblIfEven, numVal int
	for idx = len(id) - 1; idx >= 0; idx-- {
		idNum := id[idx]
		switch {
		case idNum >= '0' && idNum <= '9':
			numVal = int(idNum - '0')
			if dblIfEven%2 == 1 {
				numVal <<= 1
			}
			if numVal > 9 {
				numVal -= 9
			}
			checksum += numVal
			dblIfEven++
		default:
			return false
		}
	}
	return checksum%10 == 0
}
