module [isIsogram]

isIsogram : Str -> Bool
isIsogram = \phrase ->
    trimmed =
        phrase
        |> Str.toUtf8
        |> List.keepIf (\char -> char <= 90 && char >= 65 || char <= 122 && char >= 97)
        |> List.map
            (\char ->
                if char <= 90 && char >= 65 then
                    char + 32
                else
                    char)

    List.len trimmed == Set.len (Set.fromList trimmed)
