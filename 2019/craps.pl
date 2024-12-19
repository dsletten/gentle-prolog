#!/opt/local/bin/swipl -q -t main -f
%%
%   -*- Mode: Prolog -*-
%   Name:               craps.pl
%
%   Started:            Sat Nov 30 00:34:47 2019
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

throw_die(Roll) :-
    Roll is random(6) + 1.

throw_dice([Die1, Die2]) :-
    throw_die(Die1),
    throw_die(Die2).

snake_eyes([1, 1]).
box_cars([6, 6]).

instant_win([Die1, Die2]) :-
    7 is Die1 + Die2.
instant_win([Die1, Die2]) :-
    11 is Die1 + Die2.

%instant_loss([1, 1]).
% instant_loss([Die1, Die2]) :-
%     2 is Die1 + Die2.
instant_loss(Throw) :-
    snake_eyes(Throw).
instant_loss([Die1, Die2]) :-
    3 is Die1 + Die2.
%instant_loss([6, 6]).
% instant_loss([Die1, Die2]) :-
%     12 is Die1 + Die2.
instant_loss(Throw) :-
    box_cars(Throw).

say_throw(Throw, snake_eyes) :-
    snake_eyes(Throw).
say_throw(Throw, box_cars) :-
    box_cars(Throw).
say_throw([Die1, Die2], Sum) :- % Should not backtrack for snake eyes/box cars
    Sum is Die1 + Die2.

craps([throw, Die1, and, Die2, --, Sum, --, Outcome]) :-
    throw_dice([Die1, Die2]),
    say_throw([Die1, Die2], Sum),
    outcome([Die1, Die2], Outcome).

outcome(Throw, 'you lose') :-
    instant_loss(Throw).
outcome(Throw, 'you win') :-
    instant_win(Throw).
outcome([Die1, Die2], ['your point is', P]) :-
    P is Die1 + Die2.

% try_for_point([throw, Die1, and, Die2, --, Sum, --, Outcome]) :-
%     throw_dice([Die1, Die2]),
%     say_throw([Die1, Die2], Sum),

try_for_point(Score, Score, 'you win').
try_for_point(7, _, 'you lose').
try_for_point(Score, Point, 'throw again') :-
    Score \= Point,
    Score \= 7.

%%
%%    2020
%%


throw_die(R) :-
    R is random(6) + 1.

throw_dice([R1, R2]) :-
    throw_die(R1),
    throw_die(R2).

snake_eyes([1, 1]).

box_cars([6, 6]).

instant_win([X, Y]) :-
    X + Y =:= 7, !.
instant_win([X, Y]) :-
    X + Y =:= 11, !.

instant_loss([X, Y]) :-
    X + Y =:= 2, !.
instant_loss([X, Y]) :-
    X + Y =:= 3, !.
instant_loss([X, Y]) :-
    X + Y =:= 12, !.

say_throw(T, 'snake eyes') :-
    snake_eyes(T), !.
say_throw(T, 'box cars') :-
    box_cars(T), !.
say_throw([R1, R2], S) :-
    S is R1 + R2.

say([R1, R2], Result, Status, S) :-
    append([throw, R1, and, R2, '--', Result, '--'], Status, S).

craps(S) :-
    throw_dice(T),
    craps(T, S).
craps(T, S) :-
    instant_loss(T),
    say_throw(T, Result),
    say(T, Result, [you, lose], S), !.
craps(T, S) :-
    instant_win(T),
    say_throw(T, Result),
    say(T, Result, [you, win], S), !.
craps(T, S) :-
    say_throw(T, Result),
    say(T, Result, [your, point, is, Result], S).

try_for_point(P, S) :-
    throw_dice(T),
    try_for_point(P, T, S).
try_for_point(P, [R1, R2], S) :-
    Result is R1 + R2,
    P =:= Result,
    say([R1, R2], Result, [you, win], S), !.
try_for_point(_, [R1, R2], S) :-
    Result is R1 + R2,
    Result =:= 7,
    say([R1, R2], Result, [you, lose], S), !.
try_for_point(_, [R1, R2], S) :-
    Result is R1 + R2,
    say([R1, R2], Result, [throw, again], S).
    

