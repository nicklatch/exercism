package hamming

import "errors"

// Distance calculates the hamming distance (count of differences)
// between two string and returns the count
func Distance(a, b string) (int, error) {
	aLen, bLen := len(a), len(b)
	if aLen != bLen {
		return 0, errors.New("")
	}

	var count int
	for i := 0; i < aLen; i++ {
		if a[i] != b[i] {
			count++
		}
	}

	return count, nil
}
