#!/opt/local/bin/swipl -q -t main -f
%%
%   -*- Mode: Prolog -*-
%   Name:               ch03.pl
%
%   Started:            Tue Oct  1 00:25:59 2019
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

half(X, H) :-
    H is X / 2.

% ?- half(8, H).
% H = 4.

% ?- half(8.8, H).
% H = 4.4.

% ?- X is 8 rdiv 3.
% X = 8 rdiv 3.

% ?- X is 8 rdiv 3, half(X, H).
% X = 8 rdiv 3,
% H = 4 rdiv 3.

%% ?- half(0, H).
%% H = 0.

%% ?- half(3, H).
%% H = 1.5.

%% ?- half(-4, H).
%% H = -2.


cube(N, C) :-
    C is N * N * N.

% ?- cube(5, C).
% C = 125.

% ?- cube(5.3, C).
% C = 148.87699999999998.

% ?- X is 8 rdiv 3, cube(X, C).
% X = 8 rdiv 3,
% C = 512 rdiv 27.

% ?- cube(5, 125).
% true.

%% ?- cube(-2, C).
%% C = -8 

%% ?- cube(0, C).
%% C = 0.

%% ?- cube(pi, C).
%% C = 31.006276680299816.


one_more(M, N) :-
    N is M + 1.

% ?- one_more(2, 3).
% true.

% ?- one_more(3, 2).
% false.

% ?- one_more(3, N).
% N = 4.

%% ?- one_more(8, Y).
%% Y = 9.

%% ?- one_more(8.0, Y).
%% Y = 9.0.

%% ?- one_more(8.0, 9.0).
%% true.

%% ?- one_more(8.0, 9).
%% false.

%% ?- one_more(X, 9).
%% ERROR: Arguments are not sufficiently instantiated

%%
%%    3.6
%%
pythag(Xs, P) :-
    sum_squares(Xs, S),
    P is sqrt(S).
sum_squares([], 0).
sum_squares([H|T], S) :-
    sum_squares(T, S1),
    S is H*H + S1.

% ?- pythag([2], P).
% P = 2.0.

% ?- pythag([3, 4], P).
% P = 5.0.

% ?- pythag([3, 4, 12], P).
% P = 13.0.

hypotenuse(A, B, C) :-
    C is sqrt(A*A + B*B).

%% ?- hypotenuse(3, 4, C).
%% C = 5.0.

%% ?- hypotenuse(3.0, 4.0, C).
%% C = 5.0.

%% ?- hypotenuse(5, 12, C).
%% C = 13.0.

%% ?- hypotenuse(5, 12, 13).
%% false.

%% ?- hypotenuse(5, 12, 13.0).
%% true.

%% ?- hypotenuse(5.0, 12.0, 13.0).
%% true.

%%
%%    3.7
%%    
miles_per_gallon(InitialOdometer, FinalOdometer, GallonsConsumed, MPG) :-
    MPG is (FinalOdometer - InitialOdometer) / GallonsConsumed.

% ?- miles_per_gallon(80, 380, 50, MPG).
% MPG = 6.

% ?- miles_per_gallon(80, 380, 20, MPG).
% MPG = 15.

% ?- miles_per_gallon(80, 380, 15, MPG).
% MPG = 20.


%% miles_per_gallon(Initial, Final, Consumed, MPG) :-
%%     MPG is (Final - Initial) / Consumed.

%% ?- miles_per_gallon(0, 420.3, 18, M).
%% M = 23.35.


%%
%%    3.11
%%
longer_than(L, []) :- L \= [].
longer_than([_|T1], [_|T2]) :-
    longer_than(T1, T2).

%% ?- longer_than([a, b, c], [a, b]).
%% true ;
%% false.

%% ?- longer_than([a], []).
%% true ;
%% false.

%% ?- longer_than([a, b, c], [a, b, c]).
%% false.

%% ?- longer_than([a, b], [a, b, c]).
%% false.

longer_than2(L1, L2) :-
    length(L1, Len1),
    length(L2, Len2),
    Len1 > Len2.


%% ?- longer_than2([a, b, c], [a, b]).
%% true.

%% ?- longer_than2([a], []).
%% true.

%% ?- longer_than2([a, b, c], [a, b, c]).
%% false.

%% ?- longer_than2([a, b], [a, b, c]).
%% false.

%%
%%    3.12
%%
%% add_length(L, [N|L]) :-
%%     length(L, N).

%% add_length([], [0]).
%% add_length([H|T], [N, H|T]) :-
%%     add_length(T, [N1|T]),
%%     N is N1 + 1.

add_length(L1, L2) :-
    add_length(L1, L2, L1, 0).
add_length([], [N|L], L, N).
add_length([_|T], L2, L1, N) :-
    N1 is N + 1,
    add_length(T, L2, L1, N1).


%% ?- add_length([], L).
%% L = [0].

%% ?- add_length([a, b, c], L).
%% L = [3, a, b, c].

%% ?- add_length([moo, goo, gai, pan], L).
%% L = [4, moo, goo, gai, pan].


%% ?- add_length([a, b, c], L), add_length(L, L1).
%% L = [3, a, b, c],
%% L1 = [4, 3, a, b, c].

% (defun addlength (l)
%   (labels ((length (l)
%              (if (endp l)
%                  0
%                  (1+ (length (rest l)))) ))
%     (cons (length l) l)))

%%
%%    3.22d
%%    
first(H, [H|_]).


%% 3 ?- first(foo, [foo, bar, baz]).
%% true.

%% 4 ?- first(boing, [foo, bar, baz]).
%% false.

%%
%%    3.22e
%%    
mid_add1([A, B, C], [A, B1, C]) :-
    B1 is B + 1.

%% 6 ?- mid_add1([take, 2, cookies], L).
%% L = [take, 3, cookies].

%%
%%    3.22f
%%
convert(Scale, Temperature, Converted) :-
    Converted is (Scale * (Temperature + 40)) - 40.

fahrenheit_to_celsius(F, C) :-
    convert(5 rdiv 9, F, C).

celsius_to_fahrenheit(C, F) :-
    convert(9 rdiv 5, C, F).

f2c(F, C) :- fahrenheit_to_celsius(F, C).
c2f(C, F) :- celsius_to_fahrenheit(C, F).

% ?- fahrenheit_to_celsius(32, 0).
% true.

% ?- fahrenheit_to_celsius(32, C).
% C = 0.

% ?- fahrenheit_to_celsius(98.6, C).
% C = 36.999999999999986.

% ?- fahrenheit_to_celsius(212, C).
% C = 100.

% ?- celsius_to_fahrenheit(0, F).
% F = 32.

% ?- celsius_to_fahrenheit(37, F).
% F = 493 rdiv 5.

% ?- celsius_to_fahrenheit(37.0, F).
% F = 98.6.

% ?- celsius_to_fahrenheit(100, F).
% F = 212.

