package raindrops

import (
	"fmt"
	"math/big"
	"strings"
)

// ! This is a somewhat optimized version and not meant to be idomatic

func Convert(number int) string {

	// early return any obvious values
	switch number {
	case 3:
		return "Pling"
	case 5:
		return "Plang"
	case 7:
		return "Plong"
	}

	if big.NewInt(int64(number)).ProbablyPrime(0) {
		return fmt.Sprint(number)
	}

	sounds := [3]string{"Pling", "Plang", "Plong"}
	var rDrops strings.Builder

	// grow out builder to to avoid allocation
	rDrops.Grow(15)

	for idx, fac := range [3]int{3, 5, 7} {
		if number%fac == 0 {
			fmt.Fprint(&rDrops, sounds[idx])
		}
	}

	switch res := rDrops.String(); res {
	case "":
		return fmt.Sprint(number)
	default:
		return res
	}
}
