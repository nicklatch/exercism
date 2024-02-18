package chessboard

// File stores if a square is occupied by a piece
type File []bool

// Chessboard contains a map of eight Files, accessed with keys from "A" to "H"
type Chessboard map[string]File

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file.
func CountInFile(cb Chessboard, file string) int {
	count := 0
	for _, isOccupied := range cb[file] {
		if isOccupied {
			count++
		}
	}
	return count
}

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank.
func CountInRank(cb Chessboard, rank int) int {
	count := 0
	if rank >= 1 && rank <= 8 {
		for _, val := range cb {
			if val[rank-1] {
				count++
			}
		}
	}
	return count
}

// CountAll counts how many squares are present in the chessboard.
func CountAll(cb Chessboard) int {
	count := 0
	for _, file := range cb {
		count += len(file)
	}
	return count
}

// CountOccupied returns how many squares are occupied in the chessboard.
func CountOccupied(cb Chessboard) int {
	count := 0
	for i := 1; i < 9; i++ {
		count += CountInRank(cb, i)
	}
	return count
}
