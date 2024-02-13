package birdwatcher

// TotalBirdCount return the total bird count by summing
// the individual day's counts.
func TotalBirdCount(birdsPerDay []int) int {
	return reduce(birdsPerDay, 0, 0) // because recursion
}

// BirdsInWeek returns the total bird count by summing
// only the items belonging to the given week.
func BirdsInWeek(birdsPerDay []int, week int) int {
	weekEnd := week * 7
	weekStart := weekEnd - 7
	return reduce(birdsPerDay[weekStart:weekEnd], 0, 0)
}

// FixBirdCountLog returns the bird counts after correcting
// the bird counts for alternate days.
func FixBirdCountLog(birdsPerDay []int) []int {
	for i := 0; i < len(birdsPerDay); i++ {
		if i == 0 || i%2 == 0 {
			birdsPerDay[i] += 1
		}
	}

	return birdsPerDay
}

func reduce(arr []int, sum int, index int) int {
	switch {
	case index == len(arr)-1:
		return sum + arr[index]
	default:
		sum += arr[index]
		return reduce(arr, sum, index+1)
	}
}
