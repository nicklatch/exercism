module [score]

score : F64, F64 -> U64
score = \x, y ->
    when
        (x * x)
        |> Num.add (y * y)
        |> Num.sqrtChecked
    is
        Ok sqrt -> points sqrt
        Err _ -> 0

points : F64 -> U64
points = \landing ->
    if landing <= 1.0 then
        10
    else if landing <= 5.0 then
        5
    else if landing <= 10.0 then
        1
    else
        0
