module [colorCode, colors]

# Naive for now

colorCode : Str -> Result U64 [InvalidResistorColor]
colorCode = \color ->
    when color is
        "black" -> Ok 0
        "brown" -> Ok 1
        "red" -> Ok 2
        "orange" -> Ok 3
        "yellow" -> Ok 4
        "green" -> Ok 5
        "blue" -> Ok 6
        "violet" -> Ok 7
        "grey" -> Ok 8
        "white" -> Ok 9
        _ -> Err InvalidResistorColor

colors : List Str
colors = [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white",
]
