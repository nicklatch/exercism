module MariosMarvellousLasagna exposing (remainingTimeInMinutes)


remainingTimeInMinutes : Int -> Int -> Int
remainingTimeInMinutes layers mins =
    let
        expectedMinutesInOven =
            40

        preparationTimeInMinutes =
            layers * 2
    in
    preparationTimeInMinutes + expectedMinutesInOven - mins
