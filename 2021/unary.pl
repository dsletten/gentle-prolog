#!/opt/local/bin/swipl -q -t main -f
%%
%   -*- Mode: Prolog -*-
%   Name:               unary.pl
%
%   Started:            Sat Mar 20 01:48:12 2021
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

unary(0, []).
unary(N, [x|T]) :- N > 0,
                   N1 is N - 1,
                   unary(N1, T).

inc(M, [x|M]).
dec([x|M], M).

equal([], []).
equal([x|T1], [x|T2]) :- equal(T1, T2).

gt([x|_], []).
gt([x|T1], [x|T2]) :- gt(T1, T2).

lt(M, N) :- gt(N, M).

ge(M, N) :- gt(M, N).
ge(M, N) :- equal(M, N).

le(M, N) :- lt(M, N).
le(M, N) :- equal(M, N).

plus(M, [], M).
plus(M, [x|N], S) :- plus([x|M], N, S).

minus(M, [], M).
minus([x|M], [x|N], D) :- minus(M, N, D).

%% times(_, [], []).
%% times(M, [x|N], P) :- times(M, N, P1),
%%                       plus(M, P1, P).
%%%
%%%    Above is shorthand for this:
%%%    
%% times(M, N, P) :- minus(N, [x], N1),
%%                   times(M, N1, P1),
%%                   plus(M, P1, P).

times(M, N, P) :- times(M, N, P, []).
times(_, [], P, P) :- !.
times(M, [x|N], P, P1) :- plus(M, P1, P2),
                          times(M, N, P, P2).

%%%
%%%    The cut fixes this:
%%%

% Before
%% ?- times([x, x], N, [x, x, x, x, x, x]).
%% N = [x, x, x] ;
%%   C-c C-cAction (h for help) ? a:
%% abort
%% % Execution Aborted

% After
%% ?- times([x, x], N, [x, x, x, x, x, x]).
%% N = [x, x, x].

%%%
%%%    The cut still doesn't solve this:
%%%

%% ?- times(M, [x, x, x], [x, x, x, x, x, x]).
%% M = [x, x] ;
%%   C-c C-cAction (h for help) ? a:
%% abort

%% divide(P, D, []) :- lt(P, D).
%% divide(P, D, [x|Q]) :- minus(P, D, P1),
%%                        divide(P1, D, Q).

%%%
%%%    Symmetry with verbose times/3 above.
%%%    
%% divide(P, D, Q) :- minus(P, D, P1),
%%                    divide(P1, D, Q1),
%%                    plus(Q1, [x], Q).

divide(P, D, Q) :- divide(P, D, Q, []).
divide(P, D, Q, Q) :- lt(P, D).
divide(P, D, Q, Q1) :- minus(P, D, P1),
                       divide(P1, D, Q, [x|Q1]).


?- divide([x, x, x, x, x, x], D, [x, x, x]).
ERROR: Out of local stack
?- divide(P, [x, x], [x, x, x]).
P = [x, x, x, x, x, x] ;
P = [x, x, x, x, x, x, x] ;
ERROR: Out of global stack
