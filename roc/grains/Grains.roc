module [grainsOnSquare, totalGrains]

grainsOnSquare : U8 -> Result U64 [InvalidSquare U8]
grainsOnSquare = \square ->
    if square < 1 || square > 64 then
        Err (InvalidSquare square)
    else
        Num.powInt 2 (Num.toU64 square - 1)
        |> Ok

totalGrains : U64
totalGrains =
    Num.maxU64
