package meteorology

import "fmt"

type TemperatureUnit int

const (
	Celsius    TemperatureUnit = 0
	Fahrenheit TemperatureUnit = 1
)

func (tu TemperatureUnit) String() string {
	units := [2]string{"°C", "°F"}
	return units[tu]
}

type Temperature struct {
	degree int
	unit   TemperatureUnit
}

func (t Temperature) String() string {
	return fmt.Sprintf("%d %s", t.degree, t.unit.String())
}

type SpeedUnit int

const (
	KmPerHour    SpeedUnit = 0
	MilesPerHour SpeedUnit = 1
)

func (su SpeedUnit) String() string {
	units := [2]string{"km/h", "mph"}
	return units[su]
}

type Speed struct {
	magnitude int
	unit      SpeedUnit
}

func (s Speed) String() string {
	return fmt.Sprintf("%d %s", s.magnitude, s.unit.String())
}

type MeteorologyData struct {
	location      string
	temperature   Temperature
	windDirection string
	windSpeed     Speed
	humidity      int
}

func (md MeteorologyData) String() string {
	return fmt.Sprintf("%s: %d %s, Wind %s at %d %s, %d%% Humidity",
		md.location,
		md.temperature.degree,
		md.temperature.unit.String(),
		md.windDirection,
		md.windSpeed.magnitude,
		md.windSpeed.unit.String(),
		md.humidity)
}
