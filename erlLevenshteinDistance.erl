%% @author Ricardo A. Harari - ricardo.harari@gmail.com
%% @doc calculate/2 - compute the levenshtein distance between the two given strings - TODO: improve, is very slow for large string
%% @doc example: erlLevenshteinDistance:calculate("hello", "hello2")

-module(erlLevenshteinDistance).
-export([calculate/2]).

calculate(W1, W2) -> getDistance(W1, W2, string:len(W1), string:len(W2)).

%% Internal functions
%% ====================================================================
getDistance(_, _, 0, L2) -> L2;
getDistance(_, _, L1, 0) -> L1;
getDistance(W1, W2, L1, L2) ->
	min(getDistance(W1, W2, L1 - 1, L2) +1,
		  getDistance(W1, W2, L1, L2 -1) + 1,
		  getDistance(W1, W2, L1 -1, L2 -1) + getCost(string:substr(W1, L1, 1), string:substr(W2, L2, 1))).

getCost(S1, S1) -> 0;
getCost(_, _) -> 1.
min(C1, C2, C3) -> erlang:min(erlang:min(C1, C2), C3).
