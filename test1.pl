%['C:/Users/Sebastian/OneDrive - Universidade da Coruña/Documentos/Universidad/1er curso/2do cuatrimestre/Lógica/Prolog/test1.pl'].

/*
Prolog errors:
ERROR: test1.pl:67:17: Syntax error: Operator expected
67:17:.... This means that the error was found on line 67 which has 17 characters.
*/

/* 
Comentarios en Prolog : hay de dos tipos, comentarios de linea y de bloque. Los primeros empiezan con '%'
los segundos empiezan y terminan como este comentario 
*/

/*
Clauses:
Clauses are like a broad term for the basics units of Prolog, everything is built from clauses
then, what are the basic units? -> facts(also known as 'predicates'), rules and queries(?- ), a fact is a clause, a rule is a clause and a query is a clause. 
*/

/*
Prolog data-base(also known as base de conocimiento):
in practical terms, a prolog data-base is what we are writing here in this module, this is where queries are redirect to get an answer to
our questions, this is why, if we don't import a data-base to prolog we get an error like the next:

?- father(felipe, leonor).
ERROR: Unknown procedure: father/2 (DWIM could not correct goal)

father/2 means the fact with the relation name father with two arguments. Prolog could'nt find it, that's because 
we didn't upload our database to prolog(even if we upload our data-base, if the data-base don't have that fact, we'll get the same error).

with the symbol '?-' we are doing queries, asking, not defining facts, rules or whatever, so, we must be ensure that we have uploaded our data-base
before doing a query.

A set of facts, rules make our data-base. Our program must be written in the data-base.
*/

/*
Prolog interpreter thinks that all relation names must be contiguous, all predicates with the name x should be contiguous
so if you scatter predicates randomly throughtout the code prolog raise a Warning telling you
if it's okay that the predicates with the same name aren't contiguous you just apply that operator
*/
:- discontiguous father/2.
:- discontiguous mother/2.

/*
How to clean the screen like "clear":
first of all, we should define a rule because the command to clean the screen is hard to write everytime we want to clean the screen
the command is> write('\e[2J').
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

female(X) :- mother(X,_).
%We know that if X is a mother of someone, then X is female, but, this don't adress our entire problem, because, all the non-mother females are not counted
%as females, so, we could add this rule to simplify calculations and define as females the remaining ones that aren't mothers.
female(cristina).
female(elena).
female(leonor).
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
sister(X,Y) :- female(X), parent(Z, X), parent(Z, Y).
