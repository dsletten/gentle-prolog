#!/opt/local/bin/swipl -q -t main -f
%%
%   -*- Mode: Prolog -*-
%   Name:               ch06.pl
%
%   Started:            Fri Sep  6 00:20:39 2013
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

%%%
%%%    6.6
%%%    
%% last_element([X], X).
%% last_element([_|T], X) :- last_element(T, X).

%% ?- last_element([a, b, c, d], X).
%% X = d ;
%% false.

%% ?- last_element([a], X).
%% X = a ;
%% false.

%% ?- last_element([], X).
%% false.

last_element(L, X) :-
    reverse(L, [X|_]).

%%%
%%%    6.7
%%%
next_to_last(L, X) :-
    reverse(L, [_,X|_]).

%% ?- next_to_last([a, b, c, d], X).
%% X = c.

%% ?- next_to_last([a, b], X).
%% X = a.

%% ?- next_to_last([a], X).
%% false.

%% ?- next_to_last([], X).
%% false.
