
%consult('C:/Users/Sebastian/OneDrive - Universidade da Coruña/Documentos/Universidad/1er curso/2do cuatrimestre/Lógica/Prolog/test2.pl').

%Prolog operators:
/*
I will add the operators that I already used in some point or the ones that I'm gonna use
(The operators written inside this block comment are inside double quotation marks)
(Prolog predefined operators can't be changed, specially the arithmetic operators because they are merged with is/2)
(The functionality of the arithmetic operators are implemented inside is/2 predicate, besides that, operators are just data structures)

"," : and operator / conjunctive 
";" : or operator  / disjunctive 
(Both unification only can be written in the data_base as one part of the corpse of a Rule)
"\=": not unification
"=" : unification 
"=:=": comparator operator, == equivalent in python

*/

%Prolog Errors:
/*
    ERROR: test1.pl:67:17: Syntax error: Operator expected
    67:17:.... This means that the error was found on line 67 which has 17 characters.
*/

%Comentaries:
/* 
    Comentarios en Prolog : hay de dos tipos, comentarios de linea y de bloque. Los primeros empiezan con '%'
    los segundos empiezan y terminan como este comentario 
*/

%Clauses:
/*
    summary:
        Facts
        Rules
    Clauses are like a broad term for the basics units of Prolog, everything is built from clauses
    then, what are the basic units? -> facts(also known as 'predicates') and rules an, a fact is a clause and a rule is a clause.
*/

%Data-base:
/*
    Prolog data-base(also known as base de conocimiento in spanish):
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

%rules:
/*
    A rule is a conditional fact which is True only if satisfies certain conditions
    is composed by clauses(facts or rules).
    The sintaxis is:
    grandmother(X,Y) :- mother(X,Z), parent(Z,Y).
    where:
    grandmother is the head of the rule
    mother and parent are the body of the rule
        mother is a fact
        parent is another rule composed by mother and father clauses: parent(X,Y) :- mother(X,Y) ; father(X,Y)
*/

%functors:
/*
    A functor is what we would call a function in other programming languages.
    They are identified with the name and arity(number of arguments): data/2
    Basically a functor is the relation between object, this relation could be a fact or rule.
*/

%operators:
/*
    Operators are functors that were treated with the op directive to make them easier to read
    for us. Examples may be +,*, / operators.
    (Both functors and operators are just data structures, but the evaluation comes with)
*/

%list:
/*
    A list is just a collection of data in prolog, but this time works a little different than other programming languajes such as python, C, etc.
    Each list has two elements. The head which is individual and the Tail which is always always a list. The head is just an individual element.

    The head is the first element of our list.
    The tail is the rest of the elements of our list.

    []  predefine constant   : null
    [|]/2 predefine operator : nombre_de_cualquier_relacion(Head, Tail)
    
    % [] An Empty list
    %lista([]).

    % [1,2,3,4,5] Just a list.
    %lista([1,2,3,4,5]).

    % others notations: "[head | Tail]" [1,2,3,4,5] = [1 | [2,3,4,5]] = [1,2 | [3,4,5]] = [1,2,3 | [4,5]] = [1,2,3,4 | [5]] = [1,2,3,4,5 | []]
    
    Important predicates:
    member/2  -> given two arguments, first an object, second a list, tells us if the object is inside the list, in other words, if the object is a member of the list.
    apppend/3 -> given three arguments, first and second are the list the we wanna concatenate(the order matters), third one is the name of the resulting list
*/


%Run prolog.
/*
    To run prolog trought the terminal we must write:
    swipl
    sw stands for software, i stands for interface and pl stands for prolog
    so, swipl: software interface prolog
*/

%Exit prolog
/*
    (Without closing the terminal obviusly because that's the easiest and most straightforward method to do so)
    For exit prolog executed in the terminal we must write the predicate halt/0: "halt."
    halt means literally stop, it's just a synonym of it. So, it's easy to remember I guess
*/

/*
    upload the data-base to prolog trough the terminal:
    1- We must have the direction to the data-base, in this case: C:\Users\Sebastian\OneDrive - Universidade da Coruña\Documentos\Universidad\1er curso\2do cuatrimestre\Lógica\Prolog\test2.pl
    2- We must change \ to /, because prolog is powered by linux and in linux the directions uses / not "\" as in windows.
    3- the direction must be given in string(This is because of the spaces and non-unit character).
    4- then put it inside [] with a final period "."
    5- right click to paste the direction to the swipl.

    or you can also use consult(['C:/Users/Sebastian/OneDrive - Universidade da Coruña/Documentos/Universidad/1er curso/2do cuatrimestre/Lógica/Prolog/test2.pl'].)
    the way of doing it with [] is just an abbreviation
*/

%data-base:

has(tom,ipad). %Just a fact.

%Implementation of member predicate

pepito(X, [X|Tail]). %Base case
pepito(X, [Head|Tail]) :- pepito(X, Tail). %recursive case
%X is a member of a list if X is the Head of the list or X is contained in the list(this is true if X is a member of the Tail, previusly we prove that X is not the head)