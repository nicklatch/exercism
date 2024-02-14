module MagicianInTraining exposing (..)

import Array exposing (Array)
import Bitwise exposing (and)


getCard : Int -> Array Int -> Maybe Int
getCard index deck =
    if index < Array.length deck then
        Array.get index deck

    else
        Nothing


setCard : Int -> Int -> Array Int -> Array Int
setCard index newCard deck =
    if index < Array.length deck then
        Array.set index newCard deck

    else
        deck


addCard : Int -> Array Int -> Array Int
addCard newCard deck =
    Array.push newCard deck


removeCard : Int -> Array Int -> Array Int
removeCard index deck =
    let
        front =
            Array.slice 0 index deck

        rest =
            Array.slice (index + 1) (Array.length deck) deck
    in
    Array.append front rest


evenCardCount : Array Int -> Int
evenCardCount deck =
    Array.filter (\card -> and card 1 == 0) deck |> Array.length
