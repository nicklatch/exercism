module [parse]

parse : Str -> Result U64 _
parse = \string ->
    split = Str.toUtf8 string
    Ok (42)

utf8HexToBinary : U8 -> Result U64 _
utf8HexToBinary = \char ->
    when char is
        0 -> Ob0000
        1 -> 0b0001
        2 -> 0b0010
        3 -> 0b0011
        4 -> 0b0100
        5 -> 0b0101
        6 -> 0b0110
        7 -> 0b0111
        8 -> 0b1000
        9 -> 0b1001
        _ -> 6

