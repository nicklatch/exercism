module RolePlayingGame exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    Maybe.withDefault "Mighty Magician" name


revive : Player -> Maybe Player
revive player =
    case player.health of
        0 ->
            if Maybe.withDefault 0 player.mana >= 10 then
                Just { player | health = 100, mana = Just 100 }

            else
                Just { player | health = 100 }

        _ ->
            Nothing


castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    case player.mana of
        Nothing ->
            if player.health - manaCost < 0 then
                ( { player | health = 0 }, 0 )

            else
                ( { player | health = player.health - manaCost }, 0 )

        Just m ->
            if m - manaCost > 0 then
                ( { player | mana = Just (m - manaCost) }, manaCost * 2 )

            else
                ( player, 0 )



{-
   Notes:
   successful spell cast damage == 2 * mana cost
-}
