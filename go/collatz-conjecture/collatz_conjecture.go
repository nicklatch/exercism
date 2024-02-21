package collatzconjecture

import "errors"

func CollatzConjecture(n int) (int, error) {
	if n <= 0 {
		return 0, errors.New("")
	}

	count := 0
	current := n
	for current != 1 {
		// This mask checks if current is odd or even
		// if first bit is 1, its odd, if 0, its even
		if (current & 1) != 1 {
			// same as current / 2
			current = current >> 1
			count++
		} else {
			current = 3*current + 1
			count++
		}
	}
	return count, nil
}
