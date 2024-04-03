-module(strain).

-export([keep/2, discard/2]).

keep(_, []) ->
    [];
keep(Fn, [H | T]) ->
    case Fn(H) of
        true ->
            [H | keep(Fn, T)];
        false ->
            keep(Fn, T)
    end.

discard(_, []) ->
    [];
discard(Fn, [H | T]) ->
    case Fn(H) of
        true -> discard(Fn, T);
        false -> [H | discard(Fn, T)]
    end.
