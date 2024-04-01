open Base

type bst = Leaf | Node of bst * int * bst

let empty = Leaf

let value = function
  | Leaf -> Error "No data present"
  | Node (_, x, _) -> Ok x

let left = function
  | Leaf -> Error "No data present"
  | Node (x, _, _) -> Ok x

let right = function
  | Leaf -> Error "No data present"
  | Node (_, _, x) -> Ok x

let insert value =
  let rec f = function
    | Leaf -> Node (Leaf, value, Leaf)
    | Node (left, v, right) ->
        if value <= v then Node (f left, v, right)
        else Node (left, v, f right)
  in
  f

let rec to_list = function
  | Leaf -> []
  | Node (left, value, right) ->
      List.concat [to_list left; [value]; to_list right]
