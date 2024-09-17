module [commands]

commands : U64 -> List Str
commands = \number ->
    number
    |> reduceActions
    |> maybeReverseList number

reduceActions = \number ->
    [(1, "wink"), (2, "double blink"), (4, "close your eyes"), (8, "jump")]
    |> List.walk
        []
        (\acc, (mask, action) ->
            when Num.bitwiseAnd number mask is
                0 -> acc
                _ -> List.append acc action
        )

maybeReverseList : List Str, U64 -> List Str
maybeReverseList = \handshake, number ->
    if Num.bitwiseAnd number 16 == 0 then
        handshake
    else
        List.reverse handshake

