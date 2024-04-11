% 2. Опpеделить, является ли один список подсписком дpугого.

sublist([], _).

sublist([H | Tsub], [H | T]) :-
    sublist(Tsub, T).

sublist([_ | Tsub], [_ | T]) :-
    sublist(Tsub, T).

%sublist([2, 3, 4], [1, 2, 3, 4, 5]).

% 10. Упорядочить список методом пузырька.

swap([X, Y | Rest], [Y, X | Rest]) :- 
    X > Y.

swap([Z | Rest1], [Z | Rest2]) :- 
    swap(Rest1, Rest2).

bubble_sort(List, SortedList) :-
    swap(List, SwappedList),
    bubble_sort(SwappedList, SortedList).

bubble_sort(SortedList, SortedList) :- 
    \+ swap(SortedList, _).

% bubble_sort([8, 3, 4, 1, 5, 9, 2, 6, 5], SortedList).
