-module(bob).

-export([response/1]).

response(_String) ->
    Cleaned = string:trim(_String),
    case Cleaned of
        "" -> "Fine. Be that way!";
        _ -> message_filter(Cleaned)
    end.

message_filter(Message) ->
    Letters = lists:filter(fun(C) -> is_letter(C) end, Message),
    IsQuestion = lists:last(Message) == $?,
    AllUpperCase = all_uppercase(Letters),
    case {IsQuestion, AllUpperCase, Letters =/= []} of
        {true, true, true} -> "Calm down, I know what I'm doing!";
        {true, _, _} -> "Sure.";
        {_, true, true} -> "Whoa, chill out!";
        _ -> "Whatever."
    end.

is_letter(C) ->
    C >= $A andalso C =< $Z orelse C >= $a andalso C =< $z.

all_uppercase(Letters) ->
    lists:all(fun(C) -> C >= $A andalso C =< $Z end, Letters).
