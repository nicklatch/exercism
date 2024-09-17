module [sublist]

sublist : List a, List a -> [Equal, Sublist, Superlist, Unequal] where a implements Eq
sublist = \list1, list2 ->
    when
        list1
        |> List.len
        |> Num.compare (List.len list2)
    is
        GT ->
            when sublist list2 list1 is
                Sublist -> Superlist
                Unequal -> Unequal
                Superlist | Equal ->
                    crash "UNREACHABLE: You should not be seing this. If you are, it's totally bug"

        EQ ->
            if list1 == list2 then Equal else Unequal

        LT ->
            when
                List.range {
                    start: At 0,
                    end: At (List.len list2 - List.len list1),
                }
                |> List.findFirst \start ->
                    list2
                    |> List.sublist { start, len: List.len list1 }
                    |> Bool.isEq list1
            is
                Ok _ -> Sublist
                Err NotFound -> Unequal
