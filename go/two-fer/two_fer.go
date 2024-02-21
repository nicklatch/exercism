// Package twofer implements a function to help determine what you
// will say when handing out cookies to friends
package twofer

import "fmt"

// ShareWith accepts the param "name" as a string and returns
// the string "One for you, one for me." if the name is ""
// or it returns the name in place of "you"
func ShareWith(name string) string {
	if name == "" {
		return "One for you, one for me."
	}

	return fmt.Sprintf("One for %s, one for me.", name)
}
