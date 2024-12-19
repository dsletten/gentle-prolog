#!/opt/local/bin/swipl -q -t main -f
%%  -*- Mode: Prolog -*-
%   Name:               ch03.pl
%
%   Started:            Mon Sep 16 18:49:59 2024
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

%:- module(ch03, []).

average(X, Y, Avg) :-
    Avg is (X + Y) / 2.

%%%
%%%    3.5
%%%    
cube(X, X3) :-
    X3 is X ** 3.

%%%
%%%    3.6
%%%    
pythag(X, Y, Z) :-
    Z is sqrt(X**2 + Y**2).

%%%
%%%    3.7
%%%    
miles_per_gallon(Initial, Final, Gallons, MPG) :-
    MPG is (Final - Initial) / Gallons.

%%%
%%%    3.11
%%%
is_longer([], _) :- fail.
is_longer([_|_], []).
is_longer([_|T1], [_|T2]) :-
    is_longer(T1, T2).

%%%
%%%    3.12
%%%
add_length(L, [C|L]) :-
    length(L, C).

%%%
%%%    3.22d
%%%
first(A, [A|_]).

%%%
%%%    3.22f
%%%
convert(Scale, T1, T2) :-
    T2 is Scale * (T1 + 40) - 40.
fToC(F, C) :-
    convert(5/9, F, C).
cToF(C, F) :-
    convert(9/5, C, F).
