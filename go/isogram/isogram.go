package isogram

import (
	"regexp"
	"slices"
	"strings"
)

// matches all non-alphabetic chars
var re = regexp.MustCompile(`(?mi)\W`)

// IsIsogram accepts the param "word" of type string and returns
// a boolean based on if it contains duplicate letters
func IsIsogram(word string) bool {
	// parse out non-alphabetic chars
	parsedW := re.ReplaceAllString(word, "")
	//convert the string to lowercase and split it into letters
	split := strings.Split(strings.ToLower(parsedW), "")
	// sort the letters in place
	slices.Sort(split)

	// compacts (removes consecutive isntances of an element)
	// the split and sorted string, checks its length against
	// our initial parsed string
	return len(slices.Compact(split)) == len(parsedW)
}
