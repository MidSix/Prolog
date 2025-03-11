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
