open Base

let lower_chars str = 
    String.lowercase str
    |> String.to_list 
    |> List.sort ~compare:Char.compare
    |> String.of_char_list

let anagrams str str_lst =
    let str_chars = lower_chars str in
    let is_anagram s = 
        String.(str_chars = lower_chars s) && String.Caseless.(str <> s)
    in
    List.filter ~f:is_anagram str_lst

