open Base

let empty = Map.empty (module Char)

let valid_nucl = function 'A' | 'C' | 'G' | 'T' -> true | _ -> false

let count_nucleotide s c =
    let rec count l sum =
    match l with
    | [] -> Error "X"
    | [x] -> if x = c then Ok (sum + 1, c) else Ok (sum, c)
    | h :: t -> if h = c then count t (sum + 1) else count t sum
  in
  count s 0

let count_nucleotides s =
  failwith "'count_nucleotides' is missing"
