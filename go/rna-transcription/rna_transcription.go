package strand

func ToRNA(dna string) string {
	var result string
	for _, dnaNuc := range dna {
		switch dnaNuc {
		case 'G':
			result = result + "C"
		case 'C':
			result = result + "G"
		case 'T':
			result = result + "A"
		case 'A':
			result = result + "U"
		}
	}
	return result
}
