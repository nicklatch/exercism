module [find]

find : List U64, U64 -> Result U64 [ValueNotFound U64 (List U64)]
find = \array, value ->
    search = \lowerBound, upperBound ->
        mid = (lowerBound + upperBound) // 2
        midValue = array |> List.get? mid
        if midValue == value then
            Ok mid
        else if lowerBound == upperBound then
            Err (ValueNotFound value array)
        else if midValue > value then
            search? lowerBound (mid - 1) |> Ok
        else
            search? (mid + 1) upperBound |> Ok

    search 0 (List.len array)
    |> Result.onErr \_ -> Err (ValueNotFound value array)
