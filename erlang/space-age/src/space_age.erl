-module(space_age).

-export([age/2]).

earth_divisor() -> #{
    mercury => 0.2408467,
    venus =>  0.61519726,
    mars =>  1.8808158,
    jupiter =>  11.862615,
    saturn =>  29.447498,
    uranus =>  84.016846,
    neptune => 164.79132
}.

seconds_to_years(seconds) -> seconds / 31557600.

age(_Planet, _Seconds) -> undefined.
