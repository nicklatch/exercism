let find arr key =
    let err = Error "value not in array" in
    match arr with
    | [||] -> err
    | [| v |] -> if v = key then Ok 0 else err
    | arr ->
        let rec search left right =
            match (left + right) / 2 with
            | _ when left > right -> err
            | res when key = arr.(res) -> Ok res
            | res when key < arr.(res) -> search left (res - 1)
            | res -> search (res + 1) right
        in
        search 0 (Array.length arr - 1)