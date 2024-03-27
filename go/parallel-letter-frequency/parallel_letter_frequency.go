package letter

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(text string) FreqMap {
	frequencies := make(FreqMap, len(text))
	for _, r := range text {
		frequencies[r]++
	}
	return frequencies
}

// ConcurrentFrequency counts the frequency of each rune in the given strings,
// by making use of concurrency.
func ConcurrentFrequency(texts []string) FreqMap {
	freqChan := make(chan FreqMap)
	res := make(FreqMap, len(texts))
	for _, text := range texts {
		go func(str string) { freqChan <- Frequency(str) }(text)
	}

	for range texts {
		for rune_, count := range <-freqChan {
			res[rune_] += count
		}
	}
	return res
}
