module [value]

value : List Str -> Result U64 [InvalidColorList, UnknownColor]
value = \colors ->
    when colors is
        [c1, c2] | [c1, c2, ..] ->
            colorValue? c1
                |> Num.mul 10
                |> Num.add (colorValue? c2)
                |> Ok

        _ ->
            Err InvalidColorList

colorValue : Str -> Result U64 [UnknownColor]
colorValue = \color ->
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
        _ -> Err UnknownColor
