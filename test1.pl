/*
Prolog interpreter thinks that all relation names must be contiguous, all predicates with the name x should be contiguous
so if you scatter predicates randomly throughtout the code prolog raise a Warning asking you
if it's okay that the predicates with the same name aren't contiguous you just apply that operator
*/
:- discontiguous father/2.
:- discontiguous mother/2.

/*
(Only works in swipl directly, not executed trouhght Vscode)
How to clean the screen like "clear":
first of all, we should define a rule because the command to clean the screen is hard to write everytime we want to clean the screen
the command is: write('\e[2J').
*/

%It works only in swipl, not in this vscode terminal
clear :- write('\33\[2J').

%A prolog data-base:
%Juan Carlos is the father of Felipe, Cristina and Elena.
father(juancarlos,felipe).
father(juancarlos,cristina).
father(juancarlos,elena).

%Their mother is Sofia:
mother(sofia,felipe).
mother(sofia,cristina).
mother(sofia,elena).

%Felipe and Letizia have two children:
father(felipe,leonor).
father(felipe,sofia2).
mother(letizia,leonor).
mother(letizia,sofia2).

%Leonor and Carlos have a child
father(carlos, sebastian).
mother(leonor, sebastian).

female(X) :- mother(X,_).
%We know that if X is a mother of someone, then X is female, but, this don't adress our entire problem, because, all the non-mother females are not counted
%as females, so, we could add this rule to simplify calculations and define as females the remaining ones that aren't mothers.
female(cristina).
female(elena).
female(sofia2).

%Exercise:
/*
who are Felipe’s parents? Redefine grandmother
with a single rule using the parent relation.
*/

%grandmother(X,Z) :- mother(X,Y), parent(Y,Z).
%parent(X,Y) :- father(X,Y) ; mother(X,Y).
% ?- parent(X, felipe).
% X = juancarlos
% X = sofia.
parents(X,Y) :- father(X, Y) ; mother(X, Y).
%Exercise:
/*
Exercise: define the sister relation.
*/
%X is sister of Y.
sister(X,Y) :- female(X), X \= Y , parent(Z, X), parent(Z, Y).
% "\="  is the inequality operator. X can't be sister of herself

%Prolog backtrack
ancestor(X,Y) :- parent(X,Y). % rule1, base case to exit the recursion
ancestor(X,Z) :- parent(X,Y) , ancestor(Y,Z). % rule2, vemos si X es parent de alguien, de no ser asi pues no podra ser ancestro del que buscamos.
%De ser progenitor de alguien, cogemos ese alguien y ahora vemos si ese alguien es ancestro de otro. (Ya comprobamos que X aunque sea progenitor, no es progenitor del que buscamos)
%Ahora vuelve a empezar el ancestor mirando las dos reglas, hasta que ese Y sea ancestro de Z, y eso sera cuando Y sea progenitor de Z. Va haciendo backtracking si es necesario y asi.


%Prolog functions
born(juancarlos,f(5,1,1938)).
born(felipe,f(30,1,1968)).
born(letizia,f(15,9,1972)).
born(sofia,f(2,11,1938)).
born(sebastian, f(18,09,2005)).

later(f(_,_,Y), f(_,_,Y1)) :- Y>Y1.
later(f(_,M,Y), f(_,M1,Y)) :- M>M1.
later(f(D,M,Y), f(D1,M,Y)) :- D>D1.

birthday(X,d(D,M)) :- born(X,f(D,M,_)).

%Exercise of digital circuit:
or(and(a,b), and(or(b,c), and(c,b))).
%Exercise Build a predicate eval/5.... Page 90
/*
Where A,B,C are the start
values of a,b,c
Circuit is the logical operations
and X is the output
*/

eval(A,_,_, a, A)
eval(_,B,_, b, B)
eval(_,_,C, c, C)

:- op(800,xfx,<==>).
:- op(700,xfy,v).
:- op(600,xfy,&).
:- op(500,fy,not).

eval(A,B,C, Circuit, X).
