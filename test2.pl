%facts:

/*
    A fact, also known as predicate, is a declarative sentence that is True, is defined in that way. Prolog interpreter takes the fact and asign the boolean True
    in simpler words, a fact is just a relation between two things, if you write a(b, c) you are saying that b and c are related trough a. you could think of a
    like a bridge that enable b and c to meet. c could meet b and b could meet c, is like bijective. From now on, just for convention, we will interprete
    the relation as: b,c,a in other words, b is related to c trough a.

    now. A fact is composed by two parts, the first one is the name of the relation, it could be whatever, literally, then are the name of the arguments.
    In a(b,c): a / name of the relation. b,c / name of the arguments. argument name's must start with lower/upper case depending if we are dealing with an object
    or a variable.

    an object is individual and inmutable, a variable is individual but mutable.
    whatever(Perro, pelota). here the name of the relation 'whatever' and 'Perro' is the name of a variable, then 'pelota' is the name of an object.
    So, the variable Perro is related to the object pelota trough the relation whatever.

    but names should be more descriptive like:
    has(tom,ipad).
    object tom is related trough ipad by the relation has. tom has an ipad.
    
    ?- sell(tom,ipad). If we make this query will get an error, because is not defined in our data-base.
    Even if tom and ipad are related, they aren't with that relation.
*/

/*
Run prolog.
To run prolog trought the terminal we must write:
swipl
sw stands for software, i stands for interface and pl stands for prolog
so, swipl: software interface prolog
*/

/*
upload the data-base to prolog trough the terminal:
1- We must have the direction to the data-base, in this case: C:\Users\Sebastian\OneDrive - Universidade da Coruña\Documentos\Universidad\1er curso\2do cuatrimestre\Lógica\Prolog\test2.pl
2- We must change \ to /, because prolog is powered by linux and in linux the directions uses /.
3- the direction must be given in string.
4- then put it inside [] with a final period "."
5- right click to paste the direction to the swipl.

or you can also use consult(['C:/Users/Sebastian/OneDrive - Universidade da Coruña/Documentos/Universidad/1er curso/2do cuatrimestre/Lógica/Prolog/test2.pl'].)
the way of doing it with [] is just an abbreviation
*/

%data-base:
has(tom,ipad).