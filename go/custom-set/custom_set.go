package stringset

import (
	"fmt"
	"reflect"
)

// Implement Set as a collection of unique string values.
//
// For Set.String, use '{' and '}', output elements as double-quoted strings
// safely escaped with Go syntax, and use a comma and a single space between
// elements. For example, a set with 2 elements, "a" and "b", should be formatted as {"a", "b"}.
// Format the empty set as {}.

// Define the Set type here.

type Set map[string]struct{}

func New() Set {
	return Set{}
}

func NewFromSlice(l []string) Set {
	result := make(Set, len(l))
	for _, str := range l {
		result[str] = struct{}{}
	}
	return result
}

func (s Set) String() string {
	keys := make([]string, 0, len(s))
	for elem, _ := range s {
		keys = append(keys, elem)
	}
	return fmt.Sprintf("%#v", keys)[8:]
}

func (s Set) IsEmpty() bool {
	return len(s) == 0
}

func (s Set) Has(elem string) bool {
	for el, _ := range s {
		if el == elem {
			return true
		}
	}
	return false
}

func (s Set) Add(elem string) {
	s[elem] = struct{}{}
}

func Subset(s1, s2 Set) bool {
	s1Len := len(s1)
	s2Len := len(s2)
	if s1Len == 0 {
		return true
	}
	if s2Len == 0 {
		return false
	}
	if s1Len == s2Len && !reflect.DeepEqual(s1, s2) {
		return false
	}

	return true
}

func Disjoint(s1, s2 Set) bool {
	if len(s1) == 0 || len(s2) == 0 {
		return true
	}

	// FIXME!
	return true
}

func Equal(s1, s2 Set) bool {
	return reflect.DeepEqual(s1, s2)
}

func Intersection(s1, s2 Set) Set {
	// TODO
	return Set{}
}

func Difference(s1, s2 Set) Set {
	// TODO
	return Set{}
}

func Union(s1, s2 Set) Set {
	union := NewFromSlice(s1.Members())
	for elem, _ := range s2 {
		union.Add(elem)
	}
	return union
}

func (s Set) Members() []string {
	members := make([]string, 0, len(s))
	for elem, _ := range s {
		members = append(members, elem)
	}
	return members
}
