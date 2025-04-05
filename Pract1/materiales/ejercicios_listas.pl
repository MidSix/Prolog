% head(List, Head): Retrieves the head element of a list.
%  - Example: head([1, 2, 3], 1).


% tail(List, Tail): Retrieves the tail of a list.
%  - Example: tail([1, 2, 3], [2, 3]).


% last(List, Last): Retrieves the last element of a list.
%  - Example: last([1, 2, 3], 3).


% last_wappend(List, Last): same as last/2 but is mandatory to use append.
% Example: last_wappend([1, 2, 3], 3).


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


