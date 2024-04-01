open Base

let acronym phrase =
  String.uppercase phrase
  |> String.split_on_chars ~on:[' '; '-'; '_']
  |> List.filter_map ~f:(function
       | "" -> None
       | s -> Some (String.get s 0 |> Char.to_string) )
  |> String.concat
