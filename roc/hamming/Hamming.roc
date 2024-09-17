module [distance]

distance : Str, Str -> Result (Num *) [EmptyDnaStrand, UnequalDnaStrandLengths]
distance = \strand1, strand2 ->
    (charStrand1, charStrand2) = (Str.toUtf8 strand1, Str.toUtf8 strand2)

    if
        strand1
        == ""
        && strand2
        != ""
        || strand1
        != ""
        && strand2
        == ""
    then
        Err EmptyDnaStrand
    else if List.len charStrand1 != List.len charStrand2 then
        Err UnequalDnaStrandLengths
    else
        List.map2 charStrand1 charStrand2 (\s1, s2 -> if s1 == s2 then 0 else 1)
        |> List.sum
        |> Ok

