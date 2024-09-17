module [convert]

convert : U64 -> Str
convert = \number ->
    sounds =
        sound "" number 3 "Pling"
        |> sound number 5 "Plang"
        |> sound number 7 "Plong"

    when sounds is
        "" -> Num.toStr number
        _ -> sounds

sound : Str, U64, U64, Str -> Str
sound = \acc, number, divisor, dropSound ->
    if number % divisor == 0 then
        "$(acc)$(dropSound)"
    else
        acc
