-module(accumulate).
-export([accumulate/2]).

%%
%% given a fun and a list, apply fun to each list item replacing list item with fun's return value.
%%
-spec accumulate(fun((A) -> B), list(A)) -> list(B).
accumulate(_, []) ->
    [];
accumulate(Fn, [H | T]) ->
    [Fn(H) | accumulate(Fn, T)].
