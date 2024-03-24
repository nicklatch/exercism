// Package bob contains a function for replying to that dirty rascal, Bob.
package bob

import (
	"strings"
	"unicode"
)

func Hey(remark string) string {
	remark = strings.TrimSpace(remark)
	if remark == "" {
		return "Fine. Be that way!"
	}

	isQuestion := strings.HasSuffix(remark, "?")
	if loudNoises(remark) {
		if isQuestion {
			return "Calm down, I know what I'm doing!"
		}
		return "Whoa, chill out!"
	}
	if isQuestion {
		return "Sure."
	}
	return "Whatever."
}

func loudNoises(remark string) bool {
	if strings.IndexFunc(remark, unicode.IsLetter) == -1 {
		return false
	}
	return strings.ToUpper(remark) == remark
}
