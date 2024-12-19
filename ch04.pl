#!/usr/local/bin/pl -q -t main -f
%%
%   -*- Mode: Prolog -*-
%   Name:               ch04.pl
%
%   Started:            Wed Aug  7 19:05:00 2013
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
%%%    4.10
%%%
%% constrain(X, Min, Max, X) :-
%%     X >= Min,
%%     X =< Max.
%% constrain(X, Min, _, Min) :-
%%     X < Min.
%% constrain(X, _, Max, Max) :-
%%     X > Max.

constrain(X, Min, Max, C) :-
    C is max(min(X, Max), Min).

%% ?- constrain(3, -50, 50, C).
%% C = 3 ;
%% false.

%% ?- constrain(92, -50, 50, C).
%% C = 50.

%% ?- constrain(-75, -50, 50, C).
%% C = -50 ;
%% false.

%%%
%%%    4.11
%%%
%% first_zero([0|_], first).
%% first_zero([H, 0|_], second) :- H \= 0.
%% first_zero([H1, H2, 0], third) :- H1 \= 0, H2 \= 0.
%% first_zero([H1, H2, H3], none) :- H1 \= 0, H2 \= 0, H3 \= 0.

%% first_zero([0|_], first) :- !.
%% first_zero([_, 0|_], second) :- !.
%% first_zero([_, _, 0], third) :- !.
%% first_zero([_, _, _], none).

first_zero(L, I) :-
    first_zero(L, [first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth], I).
first_zero([], _, none) :- !.
first_zero(_, [], too_deep) :- !.
first_zero([0|_], [I|_], I) :- !.
first_zero([_|T1], [_|T2], I) :-
    first_zero(T1, T2, I).

%% ?- first_zero([0, 1, 2], Z).
%% Z = first ;
%% false.

%% ?- first_zero([1, 0, 2], Z).
%% Z = second ;
%% false.

%% ?- first_zero([1, 2, 0], Z).
%% Z = third ;
%% false.

%% ?- first_zero([1, 2, 3], Z).
%% Z = none.

%%%
%%%    4.12
%%%
cycle(99, 1) :- !.
cycle(X, error) :- X < 1, !.
cycle(X, error) :- X > 99, !.
cycle(X, X1) :- X1 is X + 1.

%% ?- cycle(1, C).
%% C = 2.

%% ?- cycle(99, C).
%% C = 1.

%% ?- cycle(1, C), cycle(C, C2).
%% C = 2,
%% C2 = 3.

%% ?- cycle(0, C).
%% C = error.

%%%
%%%    4.13
%%%
how_compute(Op1, Op2, Op3, sum_of) :- Op3 is Op1 + Op2, !.
how_compute(Op1, Op2, Op3, difference_of) :- Op3 is Op1 - Op2, !.
how_compute(Op1, Op2, Op3, product_of) :- Op3 is Op1 * Op2, !.
how_compute(Op1, Op2, Op3, quotient_of) :- Op2 \= 0, Op3 is Op1 / Op2, !.
how_compute(_, _, _, beats_me).

%% ?- how_compute(3, 4, 7, H).
%% H = sum_of.

%% ?- how_compute(3, 4, 12, H).
%% H = product_of.

%% ?- how_compute(7, 4, 3, H).
%% H = difference_of.

%% ?- how_compute(12, 3, 4, H).
%% H = quotient_of.

%% ?- how_compute(2, 2, 4, H).  Ambiguous
%% H = sum_of.

%% ?- how_compute(0, 0, 0, H).  Ambiguous
%% H = sum_of.

%% ?- how_compute(3, 4, 5, H).
%% H = beats_me.

%%%
%%%    4.18
%%%    
dominates(rock, scissors).
dominates(paper, rock).
dominates(scissors, paper).

ties(rock, rock).
ties(paper, paper).
ties(scissors, scissors).

wins(P1, P2) :- dominates(P1, P2).

%%%
%%%    4.20
%%%
%% my_compare(X, X, numbers_are_the_same) :- !.
%% my_compare(X, Y, first_is_smaller) :- X < Y, !.
%% my_compare(X, Y, first_is_bigger) :- X > Y.

%% ?- my_compare(2, 2, V).
%% V = numbers_are_the_same.

%% ?- my_compare(2, 3, V).
%% V = first_is_smaller.

%% ?- my_compare(3, 2, V).
%% V = first_is_bigger.

%%%
%%%    Hmmm...
%%%    /Users/dsletten/prolog/Manual/compare.html 
%%%    Numbers are compared by value. Integers and floats are treated identically. If the prolog_flag (see current_prolog_flag/2) iso is defined, all floating point numbers precede all integers.
%%%    
%% ?- compare(O, 2, 2.0).
%% O = (>).
my_compare(X, X, numbers_are_the_same) :- !.
my_compare(X, Y, first_is_smaller) :- compare(<, X, Y), !.
my_compare(X, Y, first_is_bigger) :- compare(>, X, Y).

%%%
%%%    4.21
%%%
gtest(X, Y) :- X > Y, !.
gtest(0, _) :- !.
gtest(_, 0).

%% ?- gtest(2, 3).
%% false.

%% ?- gtest(3, 2).
%% true.

%% ?- gtest(0, 3).
%% true.

%% ?- gtest(-2, 0).
%% true.

%%%
%%%    4.22
%%%
%% boiling(T, fahrenheit) :- T > 212, !.
%% boiling(T, celsius) :- T > 100, !.
%% boiling(T, kelvin) :- T > 373.15.

boiling(T, fahrenheit) :- T > 212.
boiling(T, celsius) :- T > 100.
boiling(T, kelvin) :- T > 373.15.

%%
%%    Cut prevents this!
%%

%% ?- boiling(220, S).
%% S = fahrenheit ;
%% S = celsius ;
%% false.

%% ?- boiling(400, S).
%% S = fahrenheit ;
%% S = celsius ;
%% S = kelvin.
