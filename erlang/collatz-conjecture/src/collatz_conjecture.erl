-module(collatz_conjecture).

-export([steps/1]).

steps(1) ->
    0;
steps(_N) ->
    if
        _N =< 0 -> erlang:error(badarg);
        _N rem 2 == 0 -> 1 + steps(_N div 2);
        _N rem 2 /= 0 -> 1 + steps(3 * _N + 1)
    end.
