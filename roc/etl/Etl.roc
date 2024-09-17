module [transform]

transform : Dict U64 (List U8) -> Dict U8 U64
transform = \legacy ->
    legacy
    |> Dict.toList
    |> List.map
        \(k, valList) ->
            List.map
                valList
                \v ->
                    if v >= 65 && v <= 90 then
                        (v + 32, k)
                    else
                        (v, k)
    |> List.join
    |> Dict.fromList

