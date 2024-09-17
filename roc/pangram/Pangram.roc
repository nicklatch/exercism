module [isPangram]

isPangram : Str -> Bool
isPangram = \sentence ->
    sentence
    |> Str.toUtf8
    |> Set.fromList
    |> Set.map (\char -> if char >= 'A' && char <= 'Z' then char + 32 else char)
    |> Set.keepIf (\char -> char >= 'a' && char <= 'z')
    |> Bool.isEq (List.range { start: At 'a', end: At 'z' } |> Set.fromList)
