let rec recite from until =
    let bottles = function
        | 0 -> "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
        | 1 -> "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall."
        | 2 -> "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall."
        | v -> string_of_int(v) ^ " bottles of beer on the wall, "^string_of_int(v)^" bottles of beer.\nTake one down and pass it around, "^string_of_int(v - 1)^" bottles of beer on the wall." in
    let verse current =
        if current = 0 then bottles 0 else bottles current in
    if until = 1 then verse from
    else verse from ^ "\n\n" ^ recite (from - 1) (until - 1) 

