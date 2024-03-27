package binarysearch

<<<<<<< HEAD
func SearchInts(list []int, key int) int {
	panic("Please implement the SearchInts function")
}
=======
// SearchInts searches for an element in a sorted
// sequence and returns its index or -1 if not found
func SearchInts(list []int, key int) int {
	left, mid, right := 0, 0, len(list)
	for left < right {
		mid = left + (right-left)/2
		switch {
		case list[mid] == key:
			return mid
		case list[mid] > key:
			right = mid
		case list[mid] < key:
			left = mid + 1
		}
	}
	return -1
}

// -- BENCHMARK RESULTS -- //
//cpu: 13th Gen Intel(R) Core(TM) i7-13700H
//Benchmark1e2-20         168346082                8.474 ns/op
//Benchmark1e4-20         70883443                17.34 ns/op
//Benchmark1e6-20         66198130                30.59 ns/op
//Benchmark1e8-20         27773019                43.09 ns/op
>>>>>>> 2ecd9034d4910825984a86effed4db367229ac36
