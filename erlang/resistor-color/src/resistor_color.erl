-module(resistor_color).

-export([colors/0, color_code/1]).

colors() ->
    [black, brown, red, orange, yellow, green, blue, violet, grey, white].

color_code(Color) ->
    case Color of
        black ->
            0;
        brown ->
            1;
        red ->
            2;
        orange ->
            3;
        yellow ->
            4;
        green ->
            5;
        blue ->
            6;
        violet ->
            7;
        grey ->
            8;
        white ->
            9;
        _ ->
            0
    end.
