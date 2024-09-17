module [reverse]

import unicode.Grapheme

reverse : Str -> Str
reverse = \string ->
    when Grapheme.split string is
        Ok graphemes ->
            graphemes
            |> List.reverse
            |> Str.joinWith ""

        Err _ -> "Error: Utf8 parsing error." # TODO: Make this error message not suck
