package reverse

// Reverse returns a reversed input string
func Reverse(input string) string {
	var result string
	for _, char := range input {
		result = string(char) + result
	}
	return result
}
