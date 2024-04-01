package isbn

func IsValidISBN(isbn string) bool {
	if len(isbn) < 10 || len(isbn) > 13 {
		return false
	}

	multiplier := 10
	checksum := 0
	digit := 0
	for _, val := range isbn {
		switch val {
		case '-':
			continue
		case '0', '1', '2', '3', '4', '5', '6', '7', '8', '9':
			digit = int(val - '0')
		case 'X':
			digit = 10
		default:
			return false
		}

		if multiplier < 1 || digit == 10 && multiplier > 1 {
			return false
		}
		checksum += digit * multiplier
		multiplier -= 1
	}
	return multiplier == 0 && checksum%11 == 0
}
