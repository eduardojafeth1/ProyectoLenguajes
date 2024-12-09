% esPrimo
esPrimo(0) :- false.
esPrimo(1) :- false.

esPrimo(N) :-
    N > 1,
    not(divisible(N, 2)).

esPrimo(N) :-
    N > 1,
    not(tiene_divisor(N, 2)).

divisible(N, Divisor) :-
    N mod Divisor =:= 0.

tiene_divisor(N, Divisor) :-
    Divisor < N,
    N mod Divisor =:= 0.

%fibnacci

fibonacci(1, [0]).                  
fibonacci(2, [0, 1]).               

fibonacci(N, [0, 1 | Rest]) :- 
    N > 2, 
    fibonacciRecursivo(0, 1, N, Rest).

fibonacciRecursivo(_, B, 1, [B]).  
fibonacciRecursivo(A, B, N, [B | Rest]) :- 
    N > 1, 
    N1 is N - 1, 
    C is A + B, 
    fibonacciRecursivo(B, C, N1, Rest).



%elementoEnConjunto

existe_en_conjunto(_, []) :- 
    false.

existe_en_conjunto(Elem, [Elem | _]) :- 
    true.

existe_en_conjunto(Elem, [_ | Rest]) :- 
    existe_en_conjunto(Elem, Rest).


%Maximo comun Divisor
mcd(X, 0, X) :- !.  
mcd(X, Y, R) :-
    Res is X mod Y, 
    mcd(Y, Res, R).  

