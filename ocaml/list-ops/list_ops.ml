let rec length = function [] -> 0 | [ _ ] -> 1 | _ :: t -> 1 + length t

let reverse lst =
  let rec rev_list ?(acc = []) = function
    | [] -> acc
    | h :: t -> rev_list ~acc:(h :: acc) t
  in
  rev_list lst

let rec map ~f lst = match lst with [] -> [] | h :: t -> f h :: map ~f t

let rec filter ~f = function
  | [] -> []
  | h :: t -> if f h then h :: filter ~f t else filter ~f t

let rec fold ~init ~f = function
  | [] -> init
  | h :: t -> fold ~init:(f init h) ~f t

let rec append list_a list_b =
  match list_a with [] -> list_b | h :: t -> h :: append t list_b

let rec concat = function [] -> [] | h :: t -> append h @@ concat t
