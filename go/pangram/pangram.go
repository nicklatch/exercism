package pangram

const alphaMask int = 0b11111111111111111111111111

// IsPangram determines whether the input string contains all letters of the alphabet
func IsPangram(input string) bool {
	inputMask := 0
	for _, currChar := range input {
		switch {
		case currChar >= 97 && currChar <= 122:
			inputMask |= 1 << (currChar - 97)
		case currChar >= 65 && currChar <= 90:
			inputMask |= 1 << (currChar - 65)
		}
	}
	return inputMask == alphaMask
}
