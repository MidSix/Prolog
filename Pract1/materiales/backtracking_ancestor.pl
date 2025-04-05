father(juancarlos, felipe).
father(juancarlos, cristina).
father(juancarlos, elena).

father(felipe, leonor).
father(felipe, sofiajr).

mother(sofia, felipe).
mother(sofia, cristina).
mother(sofia, elena).

mother(letizia, leonor).
mother(letizia, sofiajr).

female(leonor).
female(sofiajr).
female(cristina).
female(elena).

% --------------------------

female(F) :- mother(F,_).
male(M) :- father(M,_).

grandmother(GM, GC) :- 
    mother(GM, P),
    parent(P, GC).

parent(P, C) :-
    format('goal: parent(~w,~w) (Father rule)~n', [P,C]),
    format('    father(~w, ~w)? ~n', [P, C]),
    get_code(_),
    father(P, C).
parent(P, C) :-
    format('goal: parent(~w,~w) (Mother rule)~n', [P,C]),
    format('    mother(~w, ~w)? ~n', [P, C]),
    get_code(_),
    mother(P, C).


sister(S, X) :-  
    female(S),
    parent(P, S), parent(P, X),
    S \= X.

ancestor(A, P) :- 
    format('goal: ancestor(~w,~w) (Direct rule)~n',[A, P]),
    format('    parent(~w,~w)? ~n', [A, P]),
    get_code(_),
    parent(A, P).
ancestor(A, P) :- 
    format('goal: ancestor(~w,~w) (Transitivity rule)~n', [A,P]),
    format('    parent(~w, ~w), ancestor(~w, ~w)? ~n', [A,X,X,P]),
    get_code(_),
    parent(A, X), 
    get_code(_),
    ancestor(X, P).
