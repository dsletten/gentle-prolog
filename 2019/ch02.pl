#!/opt/local/bin/swipl -q -t main -f
%%
%   -*- Mode: Prolog -*-
%   Name:               ch02.pl
%
%   Started:            Sat Mar 28 06:00:51 2020
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
%%%    2.21
%%%    
pack(A, B, C, D, [[A, B], [C, D]]).

%% pack(1, 2, 3, 4, L).
%% L = [[1, 2], [3, 4]].

%% pack([a], b, c, [d], L).
%% L = [[[a], b], [c, [d]]].

%%%
%%%    2.22
%%%    
duo_cons(X, Y, L, [X, Y|L]).

%% duo_cons(patrick, seymour, [marvin], L).
%% L = [patrick, seymour, marvin].

%% duo_cons([a], [b], [[c]], L).
%% L = [[a], [b], [c]].

%%%
%%%    2.23
%%%    
two_deeper(X, [[X]]).

%% ?- two_deeper(moo, L).
%% L = [[moo]].

%% ?- two_deeper([bow, wow], L).
%% L = [[[bow, wow]]].

