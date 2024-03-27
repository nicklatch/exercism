package etl

import (
	"strings"
)

func Transform(in map[int][]string) map[string]int {
	result := make(map[string]int, 26)
	for k, v := range in {
		for _, str := range v {
			result[strings.ToLower(str)] = k
		}
	}
	return result
}
