module [isArmstrongNumber]

isArmstrongNumber : U64 -> Bool
isArmstrongNumber = \number ->
    splitNumber = number |> Num.toStr |> Str.toUtf8

    splitNumber
    |> List.map \char -> Num.toU64 (char - 48) |> Num.powInt (List.len splitNumber)
    |> List.sum
    |> Bool.isEq number
