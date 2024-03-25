// Package stringset implements the Set type and the
// associated functions and methods to manipulate it
package stringset

import (
	"fmt"
	"reflect"
)

// Set is a data structure that stores a collection
// of unique data.
type Set map[string]struct{}

// New creates and returns a new, empty Set
func New() Set {
	return make(Set, 2)
}

// NewWithCapacity returns a new set with an
// initial capacity set to cap
func NewWithCapacity(cap int) Set {
	return make(Set, cap)
}

// NewFromSlice accepts a []string and returns a new Set
// containing the unique elements
func NewFromSlice(l []string) Set {
	result := make(Set, len(l))
	for _, str := range l {
		result[str] = struct{}{}
	}
	return result
}

// -- Methods -- //

// String implements the Stringer interface for Set
func (s Set) String() string {
	keys := make([]string, 0, len(s))
	for elem, _ := range s {
		keys = append(keys, elem)
	}
	return fmt.Sprintf("%#v", keys)[8:]
}

// Members returns each member of s
func (s Set) Members() []string {
	members := make([]string, 0, len(s))
	for elem, _ := range s {
		members = append(members, elem)
	}
	return members
}

// IsEmpty checks its set contains members or not
func (s Set) IsEmpty() bool {
	return len(s) == 0
}

// Has iterates through s and returns true upon
// finding the first occurrence of elem or false
// if elem is not found in the Set
func (s Set) Has(elem string) bool {
	for el, _ := range s {
		if el == elem {
			return true
		}
	}
	return false
}

// Add adds the given elem to the Set
func (s Set) Add(elem string) {
	s[elem] = struct{}{}
}

// -- Functions -- //

// Subset returns true if s2 contains s1
// and false if it does not
func Subset(s1, s2 Set) bool {
	s1Len := len(s1)
	s2Len := len(s2)
	switch {
	case s1Len == 0:
		return true
	case s2Len == 0:
		return false
	case s1Len == s2Len && !reflect.DeepEqual(s1, s2):
		return false
	default:
		return true
	}
}

// Disjoint returns true if s1 is completely unique
// from s2, false if they share a common element
func Disjoint(s1, s2 Set) bool {
	if len(s1) == 0 || len(s2) == 0 {
		return true
	}

	for val, _ := range s2 {
		if s1.Has(val) {
			return false
		}
	}

	return true
}

// Equal returns true if each element in both sets
// are deeply equal to their corresponding element.
// It will return false upon finding the first difference
func Equal(s1, s2 Set) bool {
	return reflect.DeepEqual(s1, s2)
}

// Intersection returns a Set of common elements
// between s1 and s2
func Intersection(s1, s2 Set) Set {
	result := make([]string, 0, 5) // arbitrary initial capacity to avoid some allocation

	for val, _ := range s1 {
		if s2.Has(val) {
			result = append(result, val)
		}
	}

	return NewFromSlice(result)
}

// Difference returns a set of uncommon elements
// from s1 and s2
func Difference(s1, s2 Set) Set {
	result := make([]string, 0, 5) // arbitrary initial capacity to avoid some allocation

	for val, _ := range s1 {
		if !s2.Has(val) {
			result = append(result, val)
		}
	}

	return NewFromSlice(result)
}

// Union returns the union (combination) of the two
// given sets
func Union(s1, s2 Set) Set {
	union := NewFromSlice(s1.Members())
	for elem, _ := range s2 {
		union.Add(elem)
	}
	return union
}
