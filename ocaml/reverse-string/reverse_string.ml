let reverse_string s =
    let rec rev_ch_str acc = function
    | [] -> acc
    | h :: t -> rev_ch_str (h :: acc) t in
    String.of_seq
    @@ List.to_seq 
    @@ rev_ch_str [] (s |> String.to_seq |> List.of_seq)
