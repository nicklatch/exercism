package airportrobot

import "fmt"

type Greeter interface {
	// returns the language name as a string value
	LanguageName() string
	// accepts the name of the visitor and returns a greeting string
	Greet(visitorName string) string
}

type Italian struct{}

type Portuguese struct{}

// SayHello accepts the name of the visitor and an instance of
// the Greeter interface as args and returns a greeting string.
func SayHello(name string, greeter Greeter) string {
	return fmt.Sprintf("I can speak %s: %s", greeter.LanguageName(), greeter.Greet(name))
}

func (i Italian) LanguageName() string {
	return "Italian"
}

func (i Italian) Greet(visitorName string) string {
	return fmt.Sprintf("Ciao %s!", visitorName)
}

func (p Portuguese) LanguageName() string {
	return "Portuguese"
}

func (p Portuguese) Greet(visitorName string) string {
	return fmt.Sprintf("Olá %s!", visitorName)
}
