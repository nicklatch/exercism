// Package strain implements generic functions for
// filtering slices
package strain

// Keep returns a slice of T containing items
// that satisfy the filter
func Keep[T any](items []T, filter func(T) bool) []T {
	if len(items) == 0 {
		return items
	}

	result := make([]T, 0, len(items))
	for _, val := range items {
		if filter(val) {
			result = append(result, val)
		}
	}

	return result
}

// Discard returns a slice of T containing items
// that do not satisfy the filter
func Discard[T any](items []T, filter func(T) bool) []T {
	if len(items) == 0 {
		return items
	}

	result := make([]T, 0, len(items))
	for _, val := range items {
		if !filter(val) {
			result = append(result, val)
		}
	}

	return result
}
