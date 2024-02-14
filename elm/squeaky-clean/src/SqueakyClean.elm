module SqueakyClean exposing (clean, clean1, clean2, clean3, clean4)

import Array exposing (Array)
import Json.Decode exposing (string)


clean1 : String -> String
clean1 str =
    String.replace " " "_" <| String.trim str


clean2 : String -> String
clean2 str =
    let
        cleanStr =
            clean1 str
    in
    if String.contains "\n" str then
        String.replace "\n" "[CTRL]" cleanStr

    else if String.contains "\t" str then
        String.replace "\t" "[CTRL]" cleanStr

    else if String.contains "\u{000D}" str then
        String.replace "\u{000D}" "[CTRL]" cleanStr

    else
        cleanStr


clean3 : String -> String
clean3 str =
    case String.split "-" (clean2 str) of
        [] ->
            ""

        h :: t ->
            String.concat <| h :: List.map capitalize t


capitalize : String -> String
capitalize str =
    Maybe.withDefault str (String.uncons str |> Maybe.map (\( h, t ) -> String.fromChar (Char.toUpper h) ++ t))


clean4 : String -> String
clean4 str =
    clean3 str
        |> String.toList
        |> List.filter Char.isAlpha
        |> String.fromList


clean : String -> String
clean str =
    clean4 str
