module [age]

Planet : [
    Mercury,
    Venus,
    Earth,
    Mars,
    Jupiter,
    Saturn,
    Uranus,
    Neptune,
]

age : Planet, Dec -> Dec
age = \planet, seconds ->
    # roughly 31_557_600 in a year.
    Num.div (seconds / 31557600) (earthYears planet)

earthYears : Planet -> Dec
earthYears = \planet ->
    when planet is
        Mercury -> 0.2408467
        Venus -> 0.61519726
        Earth -> 1.0
        Mars -> 1.8808158
        Jupiter -> 11.862615
        Saturn -> 29.447498
        Uranus -> 84.016846
        Neptune -> 164.7913
