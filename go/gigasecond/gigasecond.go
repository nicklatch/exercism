package gigasecond

import (
	"log"
	"time"
)

// AddGigasecond accepts a param "t" of time.Time and returns
// a "t" plus one gigasecond
func AddGigasecond(t time.Time) time.Time {
	var gigasecond, err = time.ParseDuration("1000000000s")
	if err != nil {
		log.Println(err)
		return t
	}
	return t.Add(gigasecond)
}
