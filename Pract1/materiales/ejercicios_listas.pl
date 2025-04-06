% ["C:/Users/Sebastian/OneDrive - Universidade da Coruña/Documentos/Universidad/1er curso/2do cuatrimestre/Lógica/Prolog/pract1/materiales/ejercicios_listas.pl"].
% head(List, Head): Retrieves the head element of a list.
%  - Example: head([1, 2, 3], 1).

head([H|_], H). %Si la lista head tiene de head con un objeto H(Tail no importa: _) y el segundo argumento dado es el objeto H, entonces, H es head de la lista.  

% tail(List, Tail): Retrieves the tail of a list.
%  - Example: tail([1, 2, 3], [2, 3]).

tail([_|T], T). %Si la lista tail tiene de tail un objeto T(Head no importa: _) y el segundo argumento dado es el objeto T, entonces, T es Tail de la lista.  

% last(List, Last): Retrieves the last element of a list.
%  - Example: last([1, 2, 3], 3).

last([H | []], H). % Base case
last([_|Tail], H) :- last(Tail, H). % Recursive case
/*
    last([H | []], H). Si hicieramos solo esta comprobacion entonces miraria el primer elemento y prolog diria, pues no mi loco, el primer elemento de la lista
    O sea, el head, no es el head de la lista vacia (Salvo que le demos como lista una que solo tenga un elemento). Y como no es el head de la lista vacia devuelve false.
    Nosotros lo que tenemos que hacer es de alguna manera recorrer toda la lista y comprobar eso uno por uno,
    eso lo hacemos usando recursividad y comprobar si en algun momento se cumple el case base.
    donde:
    H: es el head de la cola.
    Tail : hombre, la tail de la cola.
    L: last element.

    Si haces algo como esto prolog falla en unificar la segunda parte de la rule y ni siquiera llama a la parte recursiva
    Le destas deciendo que el H de la head y el H que das como segundo argumento son iguales, y eso en caso general es falso
    por ejemplo: last([1,2,3,4,5],5), en este caso le estas diciendo que H=1 y H=5 son iguales y el te dice no. No le hace falta ni seguir mirando
    o sea, llamando recursivamente.
    last([H|Tail], H) :- last(Tail, H).

    En este caso le estamos diciendo que nos da igual el Head, que no haga nada con el, en cuanto al segundo argumento va a ser el que nosotros le pasamos
    al llamar a la funcion last, como Head lo ignoramos automaticamente se unifica y se llama el body recursivo de la rule.
    last([_|Tail], H) :- last(Tail, H).

    Simplemente una variacion de la anterior donde se cambia el nombre de la variable, tambien funciona
    last([_|Tail], L) :- last(Tail, L).
    
*/

% last_wappend(List, Last): same as last/2 but is mandatory to use append - Append has a predefined predicate thanks god.
% Example: last_wappend([1, 2, 3], 3).
last_wappend()

% custom_append(List1, List2, Result): Appends two lists 
%  (mandatory not to use append).
%  - Example: custom_append([1, 2], [3, 4], [1, 2, 3, 4]).


% divide(List, List1, List2): Divides a list into two: one with one with the
%  elements in odd positions and the other with the elements in even positions.
%  - Example: divide([1, 2, 3, 4], [1, 3], [2, 4]).
%  - Example: divide([1, 2, 3, 4, 5], [1, 3, 5], [2, 4]).


% inlist(Element, List): Checks if an element is in a list.
%  - Example: inlist(2, [1, 2, 3]) --> true.
%  - Example: inlist(a, [1, 2, 3]) --> false.


% remove_first(Element, List, Result): Removes the first occurrence of an 
%  element from a list.
%  - Example: remove_first(2, [1, 2, 3, 2], [1, 3, 2]).


% remove_all(Element, List, Result): Removes all occurrences of an element from
%  a list.
%  - Example: remove_all(2, [1, 2, 3, 2], [1, 3]).


% list_dif(List1, List2, Result): Finds the difference between two lists
%  (i.e. removes all the occurrences of the elements in List1 from List2).
%  - Example: list_dif([1, 4], [1, 2, 3, 4], [2,3]).
%  - Example: list_dif([1, 4, a], [1, 1, 3, 4, 5], [3,5]).


% reverse(List, Reversed): Reverses a list.
%  - Example: reverse([1, 2, 3], [3, 2, 1]).


% palindrome(List): Checks if a list is a palindrome.
%  - Example: palindrome([1, 2, 3, 2, 1]).