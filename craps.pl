#!/opt/local/bin/swipl -q -t main -f
%%
%   -*- Mode: Prolog -*-
%   Name:               craps.pl
%
%   Started:            Wed Aug 21 12:39:49 2013
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

throw_die(X) :- X is random(6) + 1.

throw_dice([D1, D2]) :- throw_die(D1), throw_die(D2).

snake_eyes([1, 1]).
box_cars([6, 6]).

throw_value([D1, D2], V) :- V is D1 + D2.

instant_win(L) :- throw_value(L, 7).
instant_win(L) :- throw_value(L, 11).

instant_loss(L) :- throw_value(L, 2).
instant_loss(L) :- throw_value(L, 3).
instant_loss(L) :- throw_value(L, 12).

say_throw([1, 1], snake_eyes) :- !.
say_throw([6, 6], box_cars) :- !.
say_throw(L, V) :- throw_value(L, V).

craps(Throw, win) :- instant_win(Throw), !.
craps(Throw, loss) :- instant_loss(Throw), !.
craps(Throw, Point) :- throw_value(Throw, Point).

