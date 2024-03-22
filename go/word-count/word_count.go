package wordcount

import (
	"strings"
	"unicode"
)

type Frequency map[string]int

func WordCount(phrase string) Frequency {
	if phrase == "" {
		return Frequency{}
	}

	phraseSplit := strings.FieldsFunc(phrase, splitters)
	freq := make(Frequency, len(phraseSplit))

	for _, val := range phraseSplit {
		parsed := strings.Trim(strings.ToLower(val), "'")
		if parsed == "" {
			continue
		}
		freq[parsed] += 1
	}
	return freq
}

func splitters(r rune) bool {
	return !unicode.IsLetter(r) && !unicode.IsNumber(r) && r != '\''
}
