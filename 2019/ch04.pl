#!/opt/local/bin/swipl -q -t main -f
%%
%   -*- Mode: Prolog -*-
%   Name:               ch04.pl
%
%   Started:            Mon Nov 11 04:22:08 2019
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
%%    4.1
%%    
make_even(N, N) :-
    N mod 2 =:= 0.
make_even(N, N1) :-
    N mod 2 =:= 1,
    N1 is N + 1.


%% 6 ?- make_even(2, N).
%% N = 2 ;
%% false.

%% 7 ?- make_even(3, N).
%% N = 4.

%% 8 ?- make_even(0, N).
%% N = 0 ;
%% false.

%% 9 ?- make_even(-1, N).
%% N = 0.

%% 10 ?- make_even(-2, N).
%% N = -2 ;
%% false.

%%
%%    4.2
%%    
%% further(X, Y) :-
%%     X > 0,
%%     Y is X + 1.
%% further(0, 0).
%% further(X, Y) :-
%%     X < 0,
%%     Y is X - 1.

further(0, 0) :- !.
further(X, Y) :-
    sign(X, S),
    Y is X + S.


%% 28 ?- further(1, F).
%% F = 2.

%% 29 ?- further(0.5, F).
%% F = 1.5.

%% 30 ?- further(3 rdiv 2, F).
%% F = 5 rdiv 2.

%% 31 ?- further(-1, F).
%% F = -2.

%% 32 ?- further(-0.5, F).
%% F = -1.5.

%% 33 ?- further(-3 rdiv 2, F).
%% F = -5 rdiv 2.

%% 34 ?- further(0, F).
%% F = 0.

%%
%%    4.4
%%
ordered([A, B], [A, B]) :-
    A =< B.
ordered([A, B], [B, A]) :-
    B < A.

%% ?- ordered([2, 3], O).
%% O = [2, 3] ;
%% false.

%% ?- ordered([3, 2], O).
%% O = [2, 3].

%% ?- ordered([2, 2], O).
%% O = [2, 2] ;
%% false.

emphasize([good|T], [great|T]) :- !.
emphasize([bad|T], [awful|T]) :- !.
emphasize(S, S).

%% ?- emphasize([good, mystery, story], E).
%% E = [great, mystery, story].

%% ?- emphasize([bad, mystery, story], E).
%% E = [awful, mystery, story].

%% ?- emphasize([mediocre, mystery, story], E).
%% E = [mediocre, mystery, story].

%%
%%    4.8
%%    
emphasize2([good|T], [great|T]) :- !.
emphasize2([bad|T], [awful|T]) :- !.
emphasize2(S, [very|S]).

%% ?- emphasize2([good, day], E).
%% E = [great, day].

%% ?- emphasize2([bad, day], E).
%% E = [awful, day].

%% ?- emphasize2([long, day], E).
%% E = [very, long, day].

%%
%%    4.9
%%
make_odd(N, M) :-
    N mod 2 =:= 0,
    M is N+1, !.
make_odd(N, N).

%% ?- make_odd(-2, N).
%% N = -1.

%% ?- make_odd(-1, N).
%% N = -1.

%% ?- make_odd(0, N).
%% N = 1.

%% ?- make_odd(1, N).
%% N = 1.

%% ?- make_odd(2, N).
%% N = 3.

%%
%%    4.10
%%    
constrain(X, Min, _, Min) :-
    X < Min.
constrain(X, _, Max, Max) :-
    X > Max.
constrain(X, Min, Max, X) :-
    X >= Min,
    X =< Max.

constrain(3, -50, 50, 3).
constrain(92, -50, 50, 50).
constrain(-1, 0, 10, 0).

%%
%%    4.11
%%    
%% first_zero([0, _, _], first).
%% first_zero([A, 0, _], second) :-
%%     A \= 0.
%% first_zero([A, B, 0], third) :-
%%     A \= 0,
%%     B \= 0.
%% first_zero([A, B, C], none) :-
%%     A \= 0,
%%     B \= 0,
%%     C \= 0.

%%%
%%%    Sweet!
%%%    
%% first_zero([0, _, _], first) :- !.
%% first_zero([_, 0, _], second) :- !.
%% first_zero([_, _, 0], third) :- !.
%% first_zero([_, _, _], none) :- !.

first_zero(L, I) :-
    first_zero(L, I, [first, second, third]).
first_zero([], none, []) :- !.
first_zero([], error, _) :- !.
first_zero(_, error, []) :- !.
first_zero([0|_], H, [H|_]) :- !.
first_zero([_|T1], I, [_|T2]) :-
    first_zero(T1, I, T2).

%% ?- first_zero([0, 3, 4], I).
%% I = first.

%% ?- first_zero([3, 0, 4], I).
%% I = second.

%% ?- first_zero([3, 4, 0], I).
%% I = third.

%% ?- first_zero([3, 4, 8], I).
%% I = none.

%% ?- first_zero([3, 4, 8, 9], I).
%% I = error.

%% ?- first_zero([3, 4], I).
%% I = error.

%%
%%    4.12
%%    
cycle(M, N) :-
    N is (M mod 99) + 1.

check_cycle(Low, High) :-
    int_list(Low, High, I),
    cycle_list(Low, High, C),
    check_lists(I, C).

int_list(Low, High, L) :-
    int_list(Low, High, L, []).
int_list(N, N, [N|L], L) :- !.
int_list(M, N, L, L1) :-
    N1 is N-1,
    int_list(M, N1, L, [N|L1]).

cycle_list(Low, High, L) :-
    cycle_list(Low, High, L, []).
cycle_list(N, N, [N2|L], L) :- 
    cycle(N, N2), !.
cycle_list(M, N, L, L1) :-
    N1 is N-1,
    cycle(N, N2),
    cycle_list(M, N1, L, [N2|L1]).

check_lists([], []).
check_lists([H1|T1], [H2|T2]) :-
    H2 is H1 + 1,
    check_lists(T1, T2).


%% ?- check_cycle(1, 98).
%% true.


%% ?- cycle(1, C).
%% C = 2.

%% ?- cycle(2, C).
%% C = 3.

%% ?- cycle(99, C).
%% C = 1.

%%
%%    4.13
%%    
how_compute(X, Y, Z, 'sum of') :-
    Z is X + Y, !.
how_compute(X, Y, Z, 'product of') :-
    Z is X * Y, !.
how_compute(_, _, _, 'beats me').


%% ?- how_compute(3, 4, 7, C).
%% C = 'sum of'.

%% ?- how_compute(3, 4, 12, C).
%% C = 'product of'.

%% ?- how_compute(1, 2, 9, C).
%% C = 'beats me'.

%%%
%%%    Ambiguous...
%%%    
%% ?- how_compute(2, 2, 4, C).
%% C = 'sum of'.

%% ?- how_compute(0, 0, 0, C).
%% C = 'sum of'.

%%
%%    4.13
%%    
%% geq(X, Y) :-
%%     X >= Y.

geq(X, Y) :-
    X > Y, !.
geq(X, Y) :-
    X =:= Y, !.

%% (defun geq (x y)
%%   (or (> x y) (= x y)))

%% (deftest test-geq ()
%%   (check
%%    (geq 8 8)
%%    (geq 8 2)
%%    (not (geq 2 8))))

%%
%%    4.16
%%
%% fancy(X, Y) :-
%%     X mod 2 =:= 1,
%%     X > 0,
%%     Y is X * X, !.
%% fancy(X, Y) :-
%%     X mod 2 =:= 1,
%%     X < 0,
%%     Y is 2 * X, !.
%% fancy(X, Y) :-
%%     Y is X / 2.
    
fancy_factor(X, X) :-
    X mod 2 =:= 1,
    X > 0, !.
fancy_factor(X, 2) :-
    X mod 2 =:= 1,
    X < 0, !.
fancy_factor(_, 1 rdiv 2).
fancy(X, Y) :-
    fancy_factor(X, Z),
    Y is X * Z.

%% ;   (= (fancy pi) (/ pi 2)))) ; First version of FANCY => error

%% ?- fancy(3, Y).
%% Y = 9.

%% ?- fancy(-7, Y).
%% Y = -14.

%% ?- fancy(0, Y).
%% Y = 0.

%% ?- fancy(8, Y).
%% Y = 4.

%% ?- fancy(-4, Y).
%% Y = -2.

%%
%%    4.17
%%
categorize(boy, child).
categorize(girl, child).
categorize(man, adult).
categorize(woman, adult).

%% ?- categorize(boy, child).
%% true.

%% ?- categorize(girl, child).
%% true.

%% ?- categorize(man, adult).
%% true.

%% ?- categorize(woman, adult).
%% true.

%% ?- categorize(boy, adult).
%% false.

%% ?- categorize(girl, adult).
%% false.

%% ?- categorize(man, child).
%% false.

%% ?- categorize(woman, child).
%% false.

%%
%%    4.18
%%    
play(X, X, tie) :- !.
play(rock, paper, second) :- !.
play(paper, scissors, second) :- !.
play(scissors, rock, second) :- !.
play(paper, rock, first) :- !.
play(scissors, paper, first) :- !.
play(rock, scissors, first) :- !.

%%
%%    4.20
%%
%compare1(X, X, 'numbers are the same') :- !. % Fails float/integer comparison
compare1(X, Y, 'numbers are the same') :-
    X =:= Y, !.
compare1(X, Y, 'first is smaller') :-
    X < Y, !.
compare1(X, Y, 'first is bigger') :-
    X > Y, !.

%% ?- compare1(2, 2, M).
%% M = 'numbers are the same'.

%% ?- compare1(2, 2.0, M).
%% M = 'numbers are the same'.

%% ?- compare1(2, 3, M).
%% M = 'first is smaller'.

%% ?- compare1(2, 3.0, M).
%% M = 'first is smaller'.

%% ?- compare1(3, 2, M).
%% M = 'first is bigger'.

%% ?- compare1(3, 2.0, M).
%% M = 'first is bigger'.

%%
%%    4.21
%%
gtest(X, Y) :-
    X > Y, !.
%% gtest(0, _) :- !.
%% gtest(_, 0) :- !.
gtest(X, _) :- 
    X =:= 0, !.
gtest(_, Y) :- 
    Y =:= 0, !.

%% ?- gtest(9, 4).
%% true.

%% ?- gtest(4, 9).
%% false.

%% ?- gtest(9, 0).
%% true.

%% ?- gtest(0.0, 9).
%% true.

%% ?- gtest(-9, 0.0).
%% true.

%%
%%    4.22
%%    
boiling(T, fahrenheit) :-
    T > 212, !.
boiling(T, celsius) :-
    T > 100, !.

%% ?- boiling(212.1, fahrenheit).
%% true.

%% ?- boiling(220, fahrenheit).
%% true.

%% ?- boiling(211, fahrenheit).
%% false.

%% ?- boiling(211, celsius).
%% true.

%% ?- boiling(100.1, celsius).
%% true.

%% ?- boiling(-40, celsius).
%% false.
