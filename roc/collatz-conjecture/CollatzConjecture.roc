module [steps]

steps : U64 -> Result U64 [InvalidArgument]
steps = \number ->
    if number <= 0 then
        Err InvalidArgument
    else
        aux = \num, acc ->
            if num == 1 then
                Ok acc
            else if num % 2 == 0 then
                aux (num // 2) (acc + 1)
            else
                aux (num * 3 + 1) (acc + 1)

        aux number 0
