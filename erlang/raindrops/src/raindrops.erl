-module(raindrops).

-export([convert/1]).

convert(Number) ->
    case {Number rem 3, Number rem 5, Number rem 7} of
        {0, 0, 0} -> "PlingPlangPlong";
        {0, 0, _} -> "PlingPlang";
        {0, _, 0} -> "PlingPlong";
        {_, 0, 0} -> "PlangPlong";
        {0, _, _} -> "Pling";
        {_, 0, _} -> "Plang";
        {_, _, 0} -> "Plong";
        _ -> integer_to_list(Number)
    end.
