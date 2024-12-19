#!/usr/local/bin/pl -q -t main -f
%%
%   -*- Mode: Prolog -*-
%   Name:               ch08.pl
%
%   Started:            Sat Feb 25 21:45:20 2012
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
%%%    8.2
%%%
odd(N) :- N mod 2 =:= 1.

anyodd([N|_]) :- odd(N).
anyodd([_|T]) :- anyodd(T).


%% ?- odd(8).
%% false.

%% ?- odd(9).
%% true.

%% ?- anyodd([]).
%% false.

%% ?- anyodd([8]).
%% false.

%% ?- anyodd([8, 9]).
%% true ;
%% false.

%% ?- anyodd([7, 8, 9]).
%% true ;
%% true ;
%% false.

%%%
%%%    8.4
%%%
laugh(0, []).
laugh(N, [ha|L]) :-
    N > 0,
    N1 is N - 1,
    laugh(N1, L).

make_list(N, L) :- make_list(N, [], L).
make_list(0, _, []).
make_list(N, Elt, [Elt|T]) :-
    N > 0,
    N1 is N - 1,
    make_list(N1, Elt, T).

%% ?- laugh(0, L).
%% L = [] ;
%% false.

%% ?- laugh(3, L).
%% L = [ha, ha, ha] ;
%% false.

%% ?- laugh(10, L).
%% L = [ha, ha, ha, ha, ha, ha, ha, ha, ha|...] ;
%% false.

%%%
%%%    8.5
%%%
addup([], 0).
addup([H|T], S) :-
    addup(T, S1),
    S is S1 + H.


%% ?- addup([2], X).
%% X = 2.

%% ?- addup([1, 2, 3], X).
%% X = 6.

%% ?- addup([1, 2, 3, 4], X).
%% X = 10.

%% ?- addup([], X).
%% X = 0.

%%%
%%%    8.6
%%%
allodd([]).
allodd([N|T]) :-
    odd(N),
    allodd(T).

%% ?- allodd([]).
%% true.

%% ?- allodd([1]).
%% true.

%% ?- allodd([1, 3]).
%% true.

%% ?- allodd([1, 3, 5]).
%% true.

%% ?- allodd([1, 3, 5, 6]).
%% false.

%%%
%%%    8.7
%%%
member(X, [X|_]).
member(X, [_|T]) :-
    member(X, T).

%% ?- member(a, [a, b, c]).
%% true ;
%% false.

%% ?- member(c, [a, b, c]).
%% true ;
%% false.

%% ?- member(a, [a, b, c, a, d]).
%% true ;
%% true ;
%% false.

%% ?- member(d, [a, b, c]).
%% false.

%%%
%%%    8.8
%%%
%% assoc([Key, Val], [[Key, Val]|_]).
%% assoc([Key, Val], [_|T]) :-
%%     assoc([Key, Val], T).

%% ?- assoc([a, 1], [[a, 1], [b, 2], [c, 3]]).
%% true ;
%% false.

%% ?- assoc([b, 2], [[a, 1], [b, 2], [c, 3]]).
%% true ;
%% false.

%% ?- assoc([b, V], [[a, 1], [b, 2], [c, 3]]).
%% V = 2 ;
%% false.

assoc(Key, Val, [[Key, Val]|_]).
assoc(Key, Val, [_|T]) :-
    assoc(Key, Val, T).

%% ?- assoc(a, V, [[a, 1], [b, 2], [c, 3]]).
%% V = 1 ;
%% false.

%% ?- assoc(b, V, [[a, 1], [b, 2], [c, 3]]).
%% V = 2 ;
%% false.

%% ?- assoc(d, V, [[a, 1], [b, 2], [c, 3]]).
%% false.

%%%
%%%    8.9
%%%
nth(0, [X|_], X).
nth(I, [_|T], X) :-
    I1 is I - 1,
    nth(I1, T, X).

%% ?- nth(0, [a, b, c, d], X).
%% X = a ;
%% false.

%% ?- nth(1, [a, b, c, d], X).
%% X = b ;
%% false.

%% ?- nth(3, [a, b, c, d], X).
%% X = d ;
%% false.

%% ?- nth(9, [a, b, c, d], X).
%% false.

%%%
%%%    8.10
%%%
add1(X, Y) :- Y is X + 1.
sub1(X, Y) :- Y is X - 1.
plus(X, 0, X).
plus(X, Y, Z) :-
    Y > 0,
    add1(X, X1),
    sub1(Y, Y1),
    plus(X1, Y1, Z).

%% ?- plus(8, 0, S).
%% S = 8 ;
%% false.

%% ?- plus(8, 5, S).
%% S = 13 ;
%% false.

%%%
%%%    8.11
%%%
fib(0, 1).
fib(1, 1).
fib(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, F1),
    fib(N2, F2),
    F is F1 + F2.

%% ?- fib(0, F).
%% F = 1 ;
%% false.

%% ?- fib(1, F).
%% F = 1 ;
%% false.

%% ?- fib(2, F).
%% F = 2 ;
%% false.

%% ?- fib(3, F).
%% F = 3 ;
%% false.

%% ?- fib(4, F).
%% F = 5 ;
%% false.

%% ?- fib(5, F).
%% F = 8 ;
%% false.

fact(0, 1).
fact(1, 1).
fact(N, F) :-
    N > 1,
    N1 is N - 1,
    fact(N1, F1),
    F is N * F1.

%% ?- fact(0, F).
%% F = 1 ;
%% false.

%% ?- fact(1, F).
%% F = 1 ;
%% false.

%% ?- fact(2, F).
%% F = 2 ;
%% false.

%% ?- fact(3, F).
%% F = 6 ;
%% false.

%% ?- fact(6, F).
%% F = 720 ;
%% false.

%% ?- fact(15, F).
%% F = 1307674368000 ;
%% false.

%%%
%%%    8.17
%%%
find_first_odd([N|_], N) :- odd(N).
find_first_odd([_|T], N) :- find_first_odd(T, N).

%% ?- find_first_odd([2, 4, 5, 9], N).
%% N = 5 ;
%% N = 9 ;
%% false.

%% ?- find_first_odd([2, 4], N).
%% false.

%% ?- find_first_odd([], N).
%% false.

%%%
%%%    8.18
%%%
last_element(X, [X]).
last_element(X, [_|T]) :- last_element(X, T).

%% ?- last_element(X, [a, b, c, d]).
%% X = d ;
%% false.

%% ?- last_element(X, [a]).
%% X = a ;
%% false.

%% ?- last_element(X, []).
%% false.

%% ?- last_element(X, [a|b]).
%% false.

last_element2(X, [X]).
last_element2(X, [X|T]) :- T \= [], T \= [_|_].
last_element2(X, [_|T]) :- T = [_|_], last_element2(X, T).


%% ?- last_element2(X, [a,b]).
%% X = b ;
%% false.

%% ?- last_element2(X, [a|b]).
%% X = a ;
%% false.

%% ?- last_element2(X, []).
%% false.

last_element3(X, [X|T]) :- atomic(T).
last_element3(X, [_|T]) :- T = [_|_], last_element3(X, T).

%% ?- last_element3(X, [a,b]).
%% X = b ;
%% false.

%% ?- last_element3(X, [a|b]).
%% X = a ;
%% false.

%% ?- last_element3(X, []).
%% false.

%%%
%%%    8.21
%%%
add_naturals(0, 0).
add_naturals(N, S) :-
    N > 0,
    N1 is N - 1,
    add_naturals(N1, S1),
    S is N + S1.

%% ?- add_naturals(0, X).
%% X = 0 ;
%% false.

%% ?- add_naturals(1, X).
%% X = 1 ;
%% false.

%% ?- add_naturals(5, S).
%% S = 15 ;
%% false.

%% ?- add_naturals(10, X).
%% X = 55 ;
%% false.

%% ?- add_naturals(-10, X).
%% false.

add_naturals1(N, S) :-
    N >= 0,
    S is N * (N+1) / 2.

%% ?- add_naturals1(0, X).
%% X = 0.

%% ?- add_naturals1(1, X).
%% X = 1.

%% ?- add_naturals1(10, X).
%% X = 55.

%% ?- add_naturals1(-10, X).
%% false.

%%%
%%%    8.22
%%%
all_equal([]).
all_equal([_]).
%all_equal([X, X]).
all_equal([H, H|T]) :- all_equal([H|T]).

%%%
%%%    8.24
%%%
%% count_down(0, []).
%% count_down(N, [N|T]) :-
%%     N > 0,
%%     N1 is N-1,
%%     count_down(N1, T).

count_down(1, [1]).
count_down(N, [N|T]) :-
    N > 1,
    N1 is N-1,
    count_down(N1, T).

%% ?- count_down(5, L).
%% L = [5, 4, 3, 2, 1] ;
%% false.

%% ?- count_down(1, L).
%% L = [1] ;
%% false.

%% ?- count_down(0, L).
%% false.

%%%
%%%    8.26
%%%
%count_down0(N, L) :- count_down0(N, L, []).
count_down0(0, [0]).
count_down0(N, L1) :-
    N > 0,
    count_down(N, L2),
    append(L2, [0], L1).

%% ?- count_down0(0, L).
%% L = [0] ;
%% false.

%% ?- count_down0(1, L).
%% L = [1, 0] ;
%% false.

%% ?- count_down0(5, L).
%% L = [5, 4, 3, 2, 1, 0] ;
%% false.

%%%
%%%    8.27
%%%
square_list([], []).
square_list([H1|T1], [H2|T2]) :-
    H2 is H1 * H1,
    square_list(T1, T2).

%% ?- square_list([3, 4, 5, 6], L).
%% L = [9, 16, 25, 36].

%% ?- square_list(L, [9, 16, 25, 36]).
%% ERROR: is/2: Arguments are not sufficiently instantiated

%%%
%%%    8.28 (See ex. 8.9)
%%%
%% nth(0, [X|_], X).
%% nth(I, [_|T], X) :-
%%     I1 is I - 1,
%%     nth(I1, T, X).
nth1(_, [], []).
nth1(0, [X|_], X).
nth1(N, [_|T], X) :-
    N > 0,
    N1 is N - 1,
    nth1(N1, T, X).

%% ?- nth1(0, [a, b, c], X).
%% X = a ;
%% false.

%% ?- nth1(1, [a, b, c], X).
%% X = b ;
%% false.

%% ?- nth1(2, [a, b, c], X).
%% X = c ;
%% false.

%% ?- nth1(3, [a, b, c], X).
%% X = [] ;
%% false.

%% ?- nth1(1000, [a, b, c], X).
%% X = [] ;
%% false.

%%%
%%%    8.29 (See ex. 8.7)
%%%

%%%
%%%    8.30 (See ex. 8.8)
%%%

%%%
%%%    8.31 (See LONGERP _On Lisp_ notes pg. 29)
%%%
compare_lengths([], [], same).
compare_lengths([_|_], [], first).
compare_lengths([], [_|_], second).
compare_lengths([_|T1], [_|T2], X) :- compare_lengths(T1, T2, X).

%% ?- compare_lengths([a, b, c], [1, 2, 3, 4], X).
%% X = second.

%% ?- compare_lengths([a, b, c, d], [1, 2, 3, 4], X).
%% X = same ;
%% false.

%% ?- compare_lengths([a, b, c, d, e], [1, 2, 3, 4], X).
%% X = first ;
%% false.

longer([_|_], []).
longer([_|T1], [_|T2]) :-
    longer(T1, T2).


%% ?- longer([a, b, c], [1, 2]).
%% true ;
%% false.

%% ?- longer([a, b, c], [1, 2, 3]).
%% false.

%% ?- longer([a, b, c], [1, 2, 3, 4]).
%% false.

%%%
%%%    8.32
%%%
sum_numeric_elts([], 0).
sum_numeric_elts([H|T], X) :-
    number(H),
    sum_numeric_elts(T, X1),
    X is X1 + H.

map(_, [], []).
map(F, [In|T1], [Out|T2]) :-
    Op =.. [F, In, Out],
    Op,
    map(F, T1, T2).
%% map(F, [H1|T1], [H2|T2]) :-
%%     Op =.. [F, H1, H1],
%%     H2 is Op,
%%     map(F, T1, T2).

square(X, X2) :- X2 is X * X.
double(X, X2) :- X2 is 2 * X.
add(X, Y, Z) :- Z is X + Y.

%% ?- map(square, [1, 2, 3], L).
%% L = [1, 4, 9] ;
%% false.

%% ?- map(double, [1, 2, 3], L).
%% L = [2, 4, 6] ;
%% false.

%% ?- map(length, ["Is", "this", "not", "pung?"], L).
%% L = [2, 4, 3, 5] ;
%% false.

apply1(F, Args) :-
    Out =.. [F|Args],
    Out.

%% ?- apply1(add, [5, 4, X]).
%% X = 9.

%% ?- apply1(add, [5, 9, X]).
%% X = 14.

%% ?- apply1(square, [3, X]).
%% X = 9.

%% ?- apply1(double, [3, X]).
%% X = 6.

filter(_, [], []).
filter(F, [In|T1], [In|T2]) :-
    apply1(F, [In]),
    !,
    filter(F, T1, T2).
filter(F, [_|T1], T2) :-
    filter(F, T1, T2), !.
%% filter(F, [In|T1], [In|T2]) :-
%%     Op =.. [F, In],
%%     Op,
%%     !,
%%     filter(F, T1, T2).

foldl(_, [X], X).
foldl(F, 

%%%
%%%    8.33
%%%
remove1(_, [], []).
remove1(Elt, [Elt|T1], T2) :-
    remove1(Elt, T1, T2), !.
remove1(Elt, [H|T1], [H|T2]) :-
    remove1(Elt, T1, T2).
%% remove(Elt, [H|T1], [H|T2]) :-
%%     Elt \= H,
%%     remove(Elt, T1, T2).

%% ?- remove(a, [a, b, c, a, d], L).
%% L = [b, c, d] ;
%% false.

%% ?- remove(k, [a, b, c, a, d], L).
%% L = [a, b, c, a, d] ;
%% false.

%%%
%%%    8.34
%%%
intersection1([], _, []).
intersection1([H|T1], L2, [H|T2]) :-
    member(H, L2),
    !,
    intersection1(T1, L2, T2).
intersection1([_|T1], L2, T2) :-
    intersection1(T1, L2, T2).

%% ?- intersection1([a, b, c], [d, b, a], L).
%% L = [a, b].

%% ?- intersection1([a, b, c], [d, e, f], L).
%% L = [].

%%%
%%%    8.35
%%%
set_difference([], _, []).
set_difference([H|T1], S2, T2) :-
    member(H, S2),
    !,
    set_difference(T1, S2, T2).
set_difference([H|T1], S2, [H|T2]) :-
    set_difference(T1, S2, T2).

%% ?- set_difference([a, b, c], [d], L).
%% L = [a, b, c].

%% ?- set_difference([a, b, c], [d, a], L).
%% L = [b, c].

%% ?- set_difference([a, b, c], [d, a, b, c], L).
%% L = [].

%%%
%%%    8.36
%%%
count_odd([], 0).
count_odd([H|T], N) :-
    odd(H),
    !,
    count_odd(T, N1),
    N is N1 + 1.
count_odd([_|T], N) :-
    count_odd(T, N).

%% ?- count_odd([1, 2, 3], N).
%% N = 2.

%% ?- count_odd([2, 4, 6, 8], N).
%% N = 0.

%%%
%%%    8.39
%%%

