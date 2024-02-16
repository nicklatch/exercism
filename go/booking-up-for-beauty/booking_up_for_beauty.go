package booking

import (
	"fmt"
	"time"
)

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
	t, err := time.Parse("1/02/2006 15:04:05", date)
	if err != nil {
		panic(err)
	}
	return t
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
	t, err := time.Parse("January 2, 2006 15:04:05", date)
	if err != nil {
		return false
	}

	return time.Now().After(t)
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
func IsAfternoonAppointment(date string) bool {
	t, err := time.Parse("Monday, January 2, 2006 15:04:05", date)
	if err != nil {
		return false
	}
	h := t.Hour()

	return h >= 12 && h < 18
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
	parsedDate, err := time.Parse("1/2/2006 15:04:05", date)
	if err != nil {
		panic("handle me")
	}

	return fmt.Sprintf("You have an appointment on %s, %s %d, %d, at %d:%d.",
		parsedDate.Weekday().String(),
		parsedDate.Month().String(),
		parsedDate.Day(),
		parsedDate.Year(),
		parsedDate.Hour(),
		parsedDate.Minute())
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
	return time.Date(time.Now().Year(), time.September, 15, 0, 0, 0, 0, time.UTC)
}
