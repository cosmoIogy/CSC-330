/* LEVEL 0: intro */

% challenge a
sanitycheck(42).

/* LEVEL 1: simple */

% challenge a
number_sign(N, Sign) :- N < 0, Sign = -1; N = 0 , Sign = 0; N > 0, Sign = 1.

% challenge b
% Convert Fahrenheit to Celsius (when Fahrenheit is given)
f_c(F, C) :-
    nonvar(F), !, 
    C is (F - 32) * 5 / 9.

% Convert Celsius to Fahrenheit (when Celsius is given)
f_c(F, C) :-
    nonvar(C), !,  
    F is C * 9 / 5 + 32.

% challenge c
range(Min, Max, []) :- Min > Max. % Empty list if Min is greater than Max
range(Min, Max, List) :- Min =< Max, numlist(Min, Max, List).

% challenge d
factorial(Num, Result) :- Num < 0, !, Result = undefined. 
factorial(0, 1). 
factorial(Num, Result) :- Num > 0, Num1 is Num - 1, factorial(Num1, Result1), Result is Num * Result1.

/* LEVEL 2: hard */

% challenge a
fib_list(Num, []) :- Num < 0, !.  
fib_list(0, [0]) :- !.
fib_list(1, [0, 1]) :- !.
fib_list(Num, List) :-
    Num > 1,
    fib_helper(1, Num, [1, 0], RevList),
    reverse(RevList, List).

fib_helper(Num, Num, Acc, Acc) :- !.
fib_helper(Count, Num, [Y, X | Rest], List) :-
    Count < Num,
    Z is X + Y,
    NextCount is Count + 1,
    fib_helper(NextCount, Num, [Z, Y, X | Rest], List).

% challenge b

% challenge c

% challenge d


/* LEVEL 3: nightmare fuel */

% challenge a

