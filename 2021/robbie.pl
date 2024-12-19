#!/opt/local/bin/swipl -q -t main -f
%%
%   -*- Mode: Prolog -*-
%   Name:               robbie.pl
%
%   Started:            Wed Mar 24 01:33:36 2021
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

connected(library, south, back_stairs).
connected(library, east, upstairs_bedroom).
connected(back_stairs, north, library).
connected(back_stairs, south, downstairs_bedroom).
connected(downstairs_bedroom, north, back_stairs).
connected(downstairs_bedroom, east, dining_room).
connected(upstairs_bedroom, west, library).
connected(upstairs_bedroom, south, front_stairs).
connected(front_stairs, north, upstairs_bedroom).
connected(front_stairs, south, living_room).
connected(living_room, north, front_stairs).
connected(living_room, east, kitchen).
connected(living_room, south, dining_room).
connected(dining_room, north, living_room).
connected(dining_room, east, pantry).
connected(dining_room, west, downstairs_bedroom).
connected(kitchen, west, living_room).
connected(kitchen, south, pantry).
connected(pantry, north, kitchen).
connected(pantry, west, dining_room).

move_robbie(Location, [], Location).
move_robbie(Start, [Move|Moves], Finish) :-
    connected(Start, Move, New),
    move_robbie(New, Moves, Finish).


%% ?- move_robbie(pantry, [north, west], X).
%% X = living_room ;
%% false.

%% ?- move_robbie(pantry, [north, west, north, north, west], X).
%% X = library ;
%% false.

%% ?- move_robbie(pantry, [north, west, north, north, west, south, south, east, north], X).
%% X = living_room ;
%% false.

%% ?- move_robbie(upstairs_bedroom, [south, south, south, west, north], X).
%% X = back_stairs ;
%% false.

%% ?- move_robbie(upstairs_bedroom, [west, south], X).
%% X = back_stairs ;
%% false.
