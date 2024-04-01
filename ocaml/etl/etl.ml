let transform lst = 
  let rec aux = function
    | [] -> []
    | (k, v):: t -> (match v with
      | [] -> aux t
      | _ -> (List.map (function x -> (Char.lowercase_ascii x, k)) v) @ (aux t)
    ) in
  List.sort compare (aux lst)