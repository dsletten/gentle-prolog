#!/opt/local/bin/swipl -q -t main -f
%%
%   -*- Mode: Prolog -*-
%   Name:               unary.pl
%
%   Started:            Fri Aug 23 01:48:02 2019
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
unary(N, [x|U]) :-
    N1 is N - 1,
    unary(N1, U).

zero([]).
one([x]).
two([x, x]).

inc(N, [x|N]).
dec([x|N], N).

equal([], []).
equal([x|M], [x|N]) :-
    equal(M, N).

greater([x|_], []).
greater([x|M], [x|N]) :-
    greater(M, N).

less(M, N) :-
    greater(N, M).

plus(M, [], M).
% plus(M, [x|N], S) :- %% These commented out versions nicely match ~/prolog/books/LearnPrologNow/2020/ch03/arithmetic.pl
%     plus([x|M], N, S).
plus(M, N1, S) :-
    inc(M, M1),
    dec(N1, N),
    plus(M1, N, S).

%% one(One), two(Two), plus(One, Two, Three), plus(Three, Two, Five).
%% One = [x],
%% Two = [x, x],
%% Three = [x, x, x],
%% Five = [x, x, x, x, x]

minus(M, [], M).
% minus([x|M], [x|N], D) :-
%     minus(M, N, D).
minus(M1, N1, D) :-
    dec(M1, M),
    dec(N1, N),
    minus(M, N, D).

%% times(_, [], []).
%% % times(M, [x|N], P) :-
%% %     times(M, N, P1),
%% %     plus(P1, M, P).
%% times(M, N1, P1) :-
%%     dec(N1, N),
%%     times(M, N, P),
%%     plus(P, M, P1).

%% one(One), two(Two), plus(One, Two, Three), plus(Three, Two, Five), times(Two, Five, Ten).
%% One = [x],
%% Two = [x, x],
%% Three = [x, x, x],
%% Five = [x, x, x, x, x],
%% Ten = [x, x, x, x, x, x, x, x, x, x] ;
%% false.

%% one(One), two(Two), plus(One, Two, Three), plus(Three, Two, Five), times(Two, Three, Six).
%% One = [x],
%% Two = [x, x],
%% Three = [x, x, x],
%% Five = [x, x, x, x, x],
%% Six = [x, x, x, x, x, x] ;
%% false.

%% one(One), two(Two), plus(One, Two, Three), plus(Three, Two, Five), times(One, Five, Five).
%% One = [x],
%% Two = [x, x],
%% Three = [x, x, x],
%% Five = [x, x, x, x, x] ;
%% false.

%% one(One), two(Two), plus(One, Two, Three), plus(Three, Two, Five), times(One, X, Five).
%% One = [x],
%% Two = [x, x],
%% Three = [x, x, x],
%% Five = X, X = [x, x, x, x, x] ; <-- Ooops...Infinite loop...


times(M, N, P) :-
    times(M, N, [], P).
times(_, [], P, P).
times(M, N1, P1, P) :-
    dec(N1, N),
    plus(P1, M, P2),
    times(M, N, P2, P).


%% 21 ?- one(One), two(Two), plus(One, Two, Three), plus(Three, Two, Five), times(One, X, Five).
%% One = [x],
%% Two = [x, x],
%% Three = [x, x, x],
%% Five = X, X = [x, x, x, x, x] ;
%% ERROR: Out of local stack
%% 22 ?- one(One), two(Two), plus(One, Two, Three), plus(Three, Two, Five), times(Two, Three, Six).
%% One = [x],
%% Two = [x, x],
%% Three = [x, x, x],
%% Five = [x, x, x, x, x],
%% Six = [x, x, x, x, x, x] ;

%% declare
%% fun {DoMultiply U1 U2 P}
%%    if {IsZero U2} then P
%%    else {DoMultiply U1 {Dec U2} {Add P U1}}
%%    end
%% end
%% fun {Multiply U1 U2}
%%    if {IsZero U1} orelse {IsZero U2} then Zero
%%    else {DoMultiply U1 U2 Zero}
%%    end
%% end
%% % fun {Multiply U1 U2} % Non-tail-recursive
%% %    if {IsZero U2} then Zero
%% %    else {Add U1 {Multiply U1 {Dec U2}}}
%% %    end
%% % end

%% for
%%    X in [1 0 2 0 5 3]
%%    Y in [1 0 0 2 2 4]
%% do
%%    {Show {ToInt {Multiply {ToUnary X} {ToUnary Y}}}}
%% end



%% divide(M, N, []) :-
%%     less(M, N).
%% divide(M, N, Q) :-
%%     minus(M, N, M1),
%%     divide(M1, N, Q1),
%%     inc(Q1, Q).


%% 12 ?- one(One), two(Two), plus(One, Two, Three), plus(Three, Two, Five), divide(Two, One, Q).
%% One = [x],
%% Two = Q, Q = [x, x],
%% Three = [x, x, x],
%% Five = [x, x, x, x, x] ;
%% false.

%% 13 ?- one(One), two(Two), plus(One, Two, Three), plus(Three, Two, Five), divide(Two, Two, Q).
%% One = Q, Q = [x],
%% Two = [x, x],
%% Three = [x, x, x],
%% Five = [x, x, x, x, x] 

%% 14 ?- one(One), two(Two), plus(One, Two, Three), plus(Three, Two, Five), divide(Five, Two, Q).
%% One = [x],
%% Two = Q, Q = [x, x],
%% Three = [x, x, x],
%% Five = [x, x, x, x, x] 

%% 15 ?- one(One), two(Two), plus(One, Two, Three), plus(Three, Two, Five), divide(Five, One, Q).
%% One = [x],
%% Two = [x, x],
%% Three = [x, x, x],
%% Five = Q, Q = [x, x, x, x, x] ;
%% false.

%% 16 ?- one(One), two(Two), plus(One, Two, Three), plus(Three, Two, Five), divide(Five, Five, Q).
%% One = Q, Q = [x],
%% Two = [x, x],
%% Three = [x, x, x],
%% Five = [x, x, x, x, x] ;
%% false.

%% 17 ?- one(One), two(Two), plus(One, Two, Three), plus(Three, Two, Five), divide(Five, Three, Q).
%% One = Q, Q = [x],
%% Two = [x, x],
%% Three = [x, x, x],
%% Five = [x, x, x, x, x] ;

divide(M, N, Q) :-
    divide(M, N, [], Q).
divide(M, N, Q, Q) :-
    less(M, N).
divide(M, N, Q1, Q) :-
    minus(M, N, M1),
    inc(Q1, Q2),
    divide(M1, N, Q2, Q).

%% declare
%% fun {DoDivide P D Q}
%%    if {LT P D} then Q
%%    else {DoDivide {Subtract P D} D {Inc Q}}
%%    end
%% end
%% fun {Divide U1 U2}
%%    if {IsZero U2} then raise error('Divide by zero') end
%% %   elseif {IsZero U1} then Zero % Unnecessary
%%    else {DoDivide U1 U2 Zero}
%%    end
%% end
%% % fun {Divide U1 U2} % Non-tail-recursive
%% %    if {IsZero U2} then raise error('Divide by zero') end
%% %    elseif {LT U1 U2} then Zero
%% %    else {Inc {Divide {Subtract U1 U2} U2}}
%% %    end
%% % end

%% for
%%    X in [1 0 6 3]
%%    Y in [1 2 2 4]
%% do
%%    {Show {ToInt {Divide {ToUnary X} {ToUnary Y}}}}
%% end

positive([x|_]).

even([]).
even([x, x|N]) :-
    even(N).

odd([x]).
odd([x, x|N]) :-
    odd(N).


%% declare
%% fun {Mod U1 U2}
%%    if {IsZero U2} then raise error('Divide by zero') end
%%    elseif {LT U1 U2} then U1
%%    else {Mod {Subtract U1 U2} U2}
%%    end
%% end

%% for
%%    X in [1 0 6 5 3]
%%    Y in [1 2 2 2 4]
%% do
%%    {Show {ToInt {Mod {ToUnary X} {ToUnary Y}}}}
%% end

%% declare
%% fun {IsEven U}
%%    {IsZero {Mod U Two}}
%% end
%% fun {IsOdd U}
%%    % {Not {IsEven U}}
%%    {EQ {Mod U Two} One}
%% end

%% for
%%    X in [1 0 6 5 3]
%% do
%%    {Show {IsEven {ToUnary X}}}
%% end

