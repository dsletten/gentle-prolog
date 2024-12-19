#!/opt/local/bin/swipl -q -t main -f
%%  -*- Mode: Prolog -*-
%   Name:               ch04.pl
%
%   Started:            Thu Oct 31 09:39:32 2024
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

:- module(ch04, []).

%%%
%%%    4.1
%%%
make_even(N, N) :-
    N mod 2 =:= 0, !.
make_even(N, N1) :-
    N mod 2 =:= 1,
    N1 is N + 1.

%%%
%%%    4.2
%%%
further(X, X) :-
    X =:= 0, !.
further(X, X1) :-
    X > 0, !,
    X1 is X + 1.
further(X, X1) :-
    X < 0, !,
    X1 is X - 1.

%%%
%%%    4.4
%%%
ordered(A, B, [A, B]) :-
    A =< B, !.
ordered(A, B, [B, A]) :-
    A > B.

compute(sum_of, X, Y, Z) :-
    Z is X + Y, !.
compute(product_of, X, Y, Z) :-
    Z is X * Y, !.
compute(_, _, _, [that, does, not, compute]).

%%%
%%%    4.8
%%%
emphasize([good|T], [great|T]) :- !.
emphasize([bad|T], [awful|T]) :- !.
emphasize(L, [very|L]).

%% ch04:  ?- emphasize([good, day], L).
%% L = [great, day].

%% ch04:  ?- emphasize([bad, day], L).
%% L = [awful, day].

%% ch04:  ?- emphasize([long, day], L).
%% L = [very, long, day].

%% ch04:  ?- emphasize([long, day], L), emphasize(L, L1).
%% L = [very, long, day],
%% L1 = [very, very, long, day].

%%%
%%%    4.9
%%%
%% make_odd(M, N) :-
%%     N is M + (M + 1) mod 2.

make_odd(M, M) :-
    M mod 2 =:= 1.
make_odd(M, N) :-
    M mod 2 =:= 0,
    N is M + 1.

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

%% ch04:  ?- constrain(3, -50, 50, C).
%% C = 3.

%% ch04:  ?- constrain(92, -50, 50, C).
%% C = 50.

%% ch04:  ?- constrain(-1, 0, 10, C).
%% C = 0.

%%%
%%%    4.11
%%%
first_zero(L, F) :-
    first_zero(L, [first, second, third], F).
first_zero([], [], none).
first_zero([0|_], [H|_], H).
first_zero([H|T1], [_|T2], F) :-
    H =\= 0,
    first_zero(T1, T2, F).

%% ch04:  ?- first_zero([0, 3, 4], F).
%% F = first ;
%% false.

%% ch04:  ?- first_zero([3, 0, 4], F).
%% F = second ;
%% false.

%% ch04:  ?- first_zero([3, 4, 0], F).
%% F = third ;
%% false.

%% ch04:  ?- first_zero([1, 2, 3], F).
%% F = none.

%%%
%%%    4.12
%%%
%% cycle(Limit, Limit, 1).
%% cycle(N, Limit, N1) :-
%%     N =\= Limit,
%%     N1 is N + 1.

cycle(N, L, C) :-
    C is N mod L + 1.

%% ch04:  ?- cycle(1, 99, X).
%% X = 2.

%% ch04:  ?- cycle(2, 99, X).
%% X = 3.

%% ch04:  ?- cycle(98, 99, X).
%% X = 99.

%% ch04:  ?- cycle(99, 99, X).
%% X = 1.

how_alike(A, A, 'the same') :- !.
how_alike(A, B, 'both odd') :-
    A mod 2 =:= 1,
    B mod 2 =:= 1, !.
how_alike(A, B, 'both even') :-
    A mod 2 =:= 0,
    B mod 2 =:= 0, !.
how_alike(A, B, 'both negative') :-
    A < 0,
    B < 0, !.
how_alike(A, B, 'both positive') :-
    A > 0,
    B > 0, !.
how_alike(_, _, 'not alike').

same_sign(0, 0).
same_sign(X, Y) :-
    X < 0,
    Y < 0.
same_sign(X, Y) :-
    X > 0,
    Y > 0.

%% ch04:  ?- same_sign(0, 0).
%% true ;
%% false.

%% ch04:  ?- same_sign(3, 5).
%% true.

%% ch04:  ?- same_sign(-9, -2).
%% true ;
%% false.

%% ch04:  ?- same_sign(-9, 0).
%% false.

%% ch04:  ?- same_sign(0.0, 0).
%% false.

same_sign1(0, 0).
same_sign1(X, Y) :-
    X * Y > 0.

%% ch04:  ?- same_sign1(0, 0).
%% true ;
%% false.

%% ch04:  ?- same_sign1(0.0, 0).
%% false.

%% ch04:  ?- same_sign1(3, 5).
%% true.

%% ch04:  ?- same_sign1(-9, -2).
%% true.

%% ch04:  ?- same_sign1(-9, 0).
%% false.

same_sign2(X, Y) :-
    sign(X) =:= sign(Y).

%% ch04:  ?- same_sign2(0, 0).
%% true.

%% ch04:  ?- same_sign2(0.0, 0).
%% true.

%% ch04:  ?- same_sign2(3, 5).
%% true.

%% ch04:  ?- same_sign2(-9, -2).
%% true.

%% ch04:  ?- same_sign2(-9, 0).
%% false.

%%%
%%%    4.15
%%%
geq(X, Y) :-
    X >= Y.

geq_(X, X).
geq_(X, Y) :-
    X > Y.

%% ch04:  ?- geq(8, 8).
%% true.

%% ch04:  ?- geq(8, 2).
%% true.

%% ch04:  ?- geq(2, 8).
%% false.

%% ch04:  ?- geq_(8, 8).
%% true ;
%% false.

%% ch04:  ?- geq_(8, 2).
%% true.

%% ch04:  ?- geq_(2, 8).
%% false.

%%%
%%%    4.16
%%%
plusp(X) :-
    X > 0.
minusp(X) :-
    X < 0.
% Only integers
evenp(N) :-
    integer(N),
    N mod 2 =:= 0.
oddp(N) :-
    integer(N),
    N mod 2 =\= 0.

fancy(X, Y) :-
    oddp(X),
    plusp(X),
    Y is X * X.
fancy(X, Y) :-
    oddp(X),
    minusp(X),
    Y is 2 * X.
fancy(X, Y) :-
    evenp(X),
    Y is X / 2.

%% ch04:  ?- fancy(3, Y).
%% Y = 9 ;
%% false.

%% ch04:  ?- fancy(-7, Y).
%% Y = -14 ;
%% false.

%% ch04:  ?- fancy(0, Y).
%% Y = 0.

%% ch04:  ?- fancy(8, Y).
%% Y = 4.

%% ch04:  ?- fancy(-4, Y).
%% Y = -2.

fancy_factor(X, X) :-
    oddp(X),
    plusp(X).
fancy_factor(X, 2) :-
    oddp(X),
    minusp(X).
fancy_factor(X, 1/2) :-
    evenp(X).

fancy2(X, Y) :-
    fancy_factor(X, K),
    Y is K * X.

%% ch04:  ?- fancy2(3, Y).
%% Y = 9 ;
%% false.

%% ch04:  ?- fancy2(-7, Y).
%% Y = -14 ;
%% false.

%% ch04:  ?- fancy2(0, Y).
%% Y = 0.

%% ch04:  ?- fancy2(8, Y).
%% Y = 4.

%% ch04:  ?- fancy2(-4, Y).
%% Y = -2.

%%%
%%%    4.17
%%%
categorize(boy, child).
categorize(girl, child).
categorize(man, adult).
categorize(woman, adult).

%% ch04:  ?- categorize(boy, child).
%% true.

%% ch04:  ?- categorize(boy, adult).
%% false.

%% ch04:  ?- categorize(X, child).
%% X = boy ;
%% X = girl.

%% ch04:  ?- categorize(woman, adult).
%% true.

%%%
%%%    4.18
%%%
beats(paper, rock).
beats(rock, scissors).
beats(scissors, paper).

play(X, X, tie).
play(A, B, first) :- beats(A, B).
play(A, B, second) :- beats(B, A).

%% ch04:  ?- play(rock, rock, W).
%% W = tie ;
%% false.

%% ch04:  ?- play(rock, paper, W).
%% W = second.

%% ch04:  ?- play(rock, scissors, W).
%% W = first ;
%% false.

%% ch04:  ?- play(paper, rock, W).
%% W = first ;
%% false.

%% ch04:  ?- play(paper, paper, W).
%% W = tie ;
%% false.

%% ch04:  ?- play(paper, scissors, W).
%% W = second.

%% ch04:  ?- play(scissors, rock, W).
%% W = second.

%% ch04:  ?- play(scissors, paper, W).
%% W = first ;
%% false.

%% ch04:  ?- play(scissors, scissors, W).
%% W = tie ;
%% false.

%%%
%%%    4.20
%%%
compare1(X, X, 'numbers are the same').
compare1(X, Y, 'first is smaller') :- X < Y.
compare1(X, Y, 'first is bigger') :- X > Y.

compare2(X, Y, R) :-
    S is floor(sign(X - Y)),
    compare2(S, R).
compare2(0, 'numbers are the same').
compare2(-1, 'first is smaller').
compare2(1, 'first is bigger').

