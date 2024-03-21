// Package listops provides methods for operating on the IntList type
package listops

import "slices"

// IntList is an abstraction of a list of integers which we can define methods on
type IntList []int

// Foldl feeds each of its IntList elements, from left to right, into the given closure
// building an accumulated value, returning that value when all elements have been processed
func (s IntList) Foldl(fn func(int, int) int, initial int) int {
	if len(s) == 0 { // early return for an empty list
		return initial
	}
	reduction := initial

	for _, val := range s {
		reduction = fn(reduction, val)
	}

	return reduction
}

// Foldr feeds each of its IntList elements, from right to left, into the given closure
// building an accumulated value, returning that value when all elements have been processed
func (s IntList) Foldr(fn func(int, int) int, initial int) int {
	if len(s) == 0 { // early return for an empty list
		return initial
	}
	reduction := initial
	length := len(s)

	for idx := range s {
		reduction = fn(s[length-1-idx], reduction)
	}

	return reduction
}

// Filter accepts a closure that returns true or false for
// each element in the IntList. Only elements yielding true
// will be returned in the new IntList
func (s IntList) Filter(fn func(int) bool) IntList {
	if len(s) == 0 { // early return for an empty list
		return s
	}
	var buffer IntList
	slices.Grow(buffer, len(s))
	for _, val := range s {
		if fn(val) {
			buffer = append(buffer, val)
		}
	}

	return buffer
}

// Length returns the length of its IntList
func (s IntList) Length() int {
	return len(s)
}

// Map returns a new slice populated with the returned values
// from the given closure. If the IntList is empty, it will return
// that IntList
func (s IntList) Map(fn func(int) int) IntList {
	if len(s) == 0 { // early return for an empty list
		return s
	}
	length := len(s)
	buffer := make(IntList, length, length)
	for idx, val := range s {
		buffer[idx] = fn(val)
	}
	return buffer
}

// Reverse returns its IntList in reverse order
func (s IntList) Reverse() IntList {
	length := len(s)
	buffer := make(IntList, length, length)
	for idx, val := range s {
		buffer[length-1-idx] = val
	}
	return buffer
}

// Append appends the contents of lst to its IntList
func (s IntList) Append(lst IntList) IntList {
	return append(s, lst...)
}

// Concat combines the lists param with its
// IntList returning one flattened list
func (s IntList) Concat(lists []IntList) IntList {
	buffer := s
	slices.Grow(buffer, len(lists))
	for _, val1 := range lists {
		buffer = append(buffer, val1...)
	}
	return buffer
}
