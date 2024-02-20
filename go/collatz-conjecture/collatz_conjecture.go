package collatzconjecture

import "errors"

func CollatzConjecture(n int) (int, error) {
	if n <= 0 {
		return 0, errors.New("")
	}

	count := 0
	current := n
	for current != 1 {
		if (current & 1) != 1 {
			current = current >> 1
			count++
		} else {
			current = 3*current + 1
			count++
		}
	}
	return count, nil
}
