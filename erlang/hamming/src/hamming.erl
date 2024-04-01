-module(hamming).

-export([distance/2]).

distance(Strand1, Strand2) when is_list(Strand1) and is_list(Strand2) ->
    distance(Strand1, Strand2, 0).

distance([], [], Acc) -> Acc;
distance([H | Strand1], [H | Strand2], Acc) -> distance(Strand1, Strand2, Acc);
distance([_ | Strand1], [_ | Strand2], Acc) -> distance(Strand1, Strand2, Acc + 1);
distance(_, _, _) -> {error, badarg}.
