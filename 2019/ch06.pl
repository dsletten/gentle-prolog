%#!/opt/local/bin/swipl -q -t main -f
%%
%   -*- Mode: Prolog -*-
%   Name:               ch06.pl
%
%   Started:            Sat Nov 30 00:34:12 2019
%   Modifications:
%
%   Purpose:
%
%
%
%   Calling Sequence:
%
%
%   Inputs:
%
%   Outputs:
%
%   Example:
%
%   Notes:
%
%%

%%
%%    6.6
%%    
last_element([H], H) :- !.
last_element([_|T], T) :-
%    atomic(T), !.      ?????
    T \= [_|_], !.
last_element([_|T], L) :-
    last_element(T, L).

%% ?- last_element([2], L).
%% L = 2.

%% ?- last_element([1|2], L).
%% L = 2.

%% ?- last_element([2, 4, 6, 8], L).
%% L = 8.

%% ?- last_element([2, 4, 6, 8|9], L).
%% L = 9.

last_element_rev([], []) :- !.
last_element_rev(L, X) :-
    reverse(L, [X|_]).

%%
%%    6.7
%%
next_to_last(L, X) :-
    reverse(L, [_,X|_]).

%% ?- next_to_last([a, b, c], X).
%% X = b.

%% ?- next_to_last([a, b], X).
%% X = a.

%% ?- next_to_last([a], X).
%% false.

%% ?- next_to_last([], X).
%% false.

%%
%%    6.8
%%
butlast([_], []) :- !.
butlast([H|T1], [H|T2]) :-
    butlast(T1, T2).

%% ?- butlast([roses, are, red], L).
%% L = [roses, are].

%% ?- butlast([g, a, g, a], L).
%% L = [g, a, g].

%% ?- butlast([a], L).
%% L = [].

%%
%%    6.15
%%    
%% contains_article(S) :-
%%     intersection(S, [a, an, the], [_|_]).

%% contains_article([sometimes, a, lonely, way]).
%% contains_article([and, a, new, home, for, the, trumpeter, swan]).
%% contains_article([we, can, see, it, now]).

%% contains_article(S) :-
%%     member(a, S), !.
%% contains_article(S) :-
%%     member(an, S), !.
%% contains_article(S) :-
%%     member(the, S), !.

contains_article(S) :-
    contains_article(S, [a, an, the]).
contains_article(S, [A|_]) :-
    member(A, S), !.
contains_article(S, [_|T]) :-
    contains_article(S, T).

%%
%%    6.18
%%
add_vowels(L, V) :-
    union(L, [a, e, i, o, u], V).

%% ?- add_vowels([], V).
%% V = [a, e, i, o, u].

%% ?- add_vowels([x, a, e, z], V).
%% V = [x, z, a, e, i, o, u].

%% ?- add_vowels([a, e, i, o, u], V).
%% V = [a, e, i, o, u].
