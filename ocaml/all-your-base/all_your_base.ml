type base = int

let convert_bases ~from ~digits ~target =
  if from <= 1 || target <= 1 then None
  else
    let rec to_base_10 acc = function
      | [] -> Some acc
      | head :: tail ->
          if head < 0 || head >= from then None
          else to_base_10 ((acc * from) + head) tail
    in
    match to_base_10 0 digits with
    | None -> None
    | Some num ->
        let rec from_base_10 num =
          if num = 0 then [0]
          else
            let rec convert num =
              if num = 0 then [] else (num mod target) :: convert (num / target)
            in
            let result = convert num in
            if result = [] then [0] else result
        in
        Some (List.rev (from_base_10 num))
