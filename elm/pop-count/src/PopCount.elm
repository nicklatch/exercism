module PopCount exposing (eggCount)


eggCount : Int -> Int
eggCount n =
    case ( n, modBy 2 n == 0 ) of
        ( 0, _ ) ->
            0

        ( _, True ) ->
            eggCount (n // 2)

        ( _, False ) ->
            1 + eggCount (n // 2)
