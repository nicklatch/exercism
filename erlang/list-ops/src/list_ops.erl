-module(list_ops).

-compile({no_auto_import, [length/1]}).

-export([
    append/2,
    concat/1,
    filter/2,
    length/1,
    map/2,
    foldl/3,
    foldr/3,
    reverse/1
]).

append(T1, T2) ->
    case {T1, T2} of
        {[], Val} ->
            Val;
        {Val, []} ->
            Val;
        {Val1, Val2} ->
            [H | Tail1] = Val1,
            [H | append(Tail1, Val2)]
    end.

concat(List) ->
    case List of
        [] -> [];
        [H | T] -> append(H, concat(T))
    end.

% Keeping these two seperate for readability
filter(_, []) ->
    [];
filter(Function, [H | T]) ->
    case Function(H) of
        true -> [H | filter(Function, T)];
        false -> filter(Function, T)
    end.

length(List) ->
    case List of
        [] -> 0;
        [_ | T] -> 1 + length(T)
    end.

map(Function, List) ->
    case List of
        [] -> [];
        [H | T] -> [Function(H) | map(Function, T)]
    end.

foldl(Function, Start, List) ->
    case List of
        [] -> Start;
        [H | T] -> foldl(Function, Function(H, Start), T)
    end.

foldr(Function, Start, List) ->
    case List of
        [] -> Start;
        _ -> foldl(Function, Start, reverse(List))
    end.

reverse(List) ->
    case List of
        [] -> [];
        _ -> reverse(List, [])
    end.

reverse(List, Acc) ->
    case List of
        [] -> Acc;
        [H | T] -> reverse(T, [H | Acc])
    end.
