let valid num =
  String.to_seq num
  |> List.of_seq
  |> List.rev
  |> let value_of ch = int_of_char ch - int_of_char '0' in
     let rec loop len sum =
       function
         | [] -> len > 1 && sum mod 10 = 0
         | ch :: cs ->
             match ch with
             | ' ' -> loop len sum cs
             | '0' .. '4' when len mod 2 = 1 ->
                 loop (len + 1) (sum + 2 * value_of ch) cs
             | '5' .. '9' when len mod 2 = 1 ->
                 loop (len + 1) (sum + 2 * value_of ch - 9) cs
             | '0' .. '9' ->
                 loop (len + 1) (sum + value_of ch) cs
             | _ -> false
     in
     loop 0 0

