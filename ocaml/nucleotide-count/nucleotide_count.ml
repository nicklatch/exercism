open Base

let empty = Map.empty (module Char)
let valid_nucl = function 'A' | 'C' | 'G' | 'T' -> true | _ -> false

let count_nucleotide s c =
  match String.find s ~f:(Fn.non valid_nucl) with
  | Some val_c -> Error val_c
  | None -> 
    if valid_nucl c then Ok (String.count s ~f:(Char.equal c))
    else Error c

let count_nucleotides s = 
  let rec counter s acc = function
    | [] -> Ok acc
    | c :: cs -> 
      match count_nucleotide s c with
      | Ok count -> counter s (Map.set acc ~key:c ~data:count) cs
      | Error c -> Error c
  in
  let res = counter s empty ['A'; 'C'; 'G'; 'T'] in 
  match res with
  | Ok m -> Ok (Map.filter m ~f:(fun v -> v > 0))
  | Error c -> Error c
