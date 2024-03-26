let find arr key =
    if Array.length arr = 0 then Error "value not in array" else
    let rec find' left right =
        match (left + right) / 2 with
        | _ when left > right -> Error "value not in array"
        | res when key = arr.(res) -> Ok res
        | res when key < arr.(res) -> find' left (res - 1)
        | res -> find' (res + 1) right
    in
    find' 0 (Array.length arr - 1)