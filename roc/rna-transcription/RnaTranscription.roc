module [toRna]

toRna : Str -> Str
toRna = \dna ->
    when
        Str.toUtf8 dna
        |> List.map (\dnaNucleotide -> toRnaNucleotide dnaNucleotide)
        |> Str.fromUtf8
    is
        Ok str -> str
        Err _ -> ""

toRnaNucleotide : U8 -> U8
toRnaNucleotide = \dnaNucleotide ->
    when dnaNucleotide is
        'G' -> 'C'
        'C' -> 'G'
        'T' -> 'A'
        'A' -> 'U'
        _ -> ' '
