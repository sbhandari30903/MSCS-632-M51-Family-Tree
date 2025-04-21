% Load the family tree facts and rules
:- [family_tree].

% Helper predicate to print a list of people
print_people([]).
print_people([H|T]) :-
    write(H), nl,
    print_people(T).

% Query for finding children
find_children :-
    write('Enter person\'s name: '),
    read(Person),
    findall(Child, parent(Person, Child), Children),
    (Children = [] ->
        write('No children found for '), write(Person), nl
    ;
        write('Children of '), write(Person), write(':'), nl,
        print_people(Children)
    ).

% Query for finding siblings
find_siblings :-
    write('Enter person\'s name: '),
    read(Person),
    findall(Sibling, sibling(Person, Sibling), Siblings),
    (Siblings = [] ->
        write('No siblings found for '), write(Person), nl
    ;
        write('Siblings of '), write(Person), write(':'), nl,
        print_people(Siblings)
    ).

% Query for checking cousins
check_cousins :-
    write('Enter first person\'s name: '),
    read(Person1),
    write('Enter second person\'s name: '),
    read(Person2),
    (cousin(Person1, Person2) ->
        write(Person1), write(' and '), write(Person2), write(' are cousins.'), nl
    ;
        write(Person1), write(' and '), write(Person2), write(' are not cousins.'), nl
    ).

% Query for finding descendants
find_descendants :-
    write('Enter person\'s name: '),
    read(Person),
    findall(Descendant, descendant(Descendant, Person), Descendants),
    (Descendants = [] ->
        write('No descendants found for '), write(Person), nl
    ;
        write('Descendants of '), write(Person), write(':'), nl,
        print_people(Descendants)
    ).

% Query for finding nth cousins
find_nth_cousins :-
    write('Enter degree of cousinhood (n): '),
    read(N),
    write('Enter first person\'s name: '),
    read(Person1),
    write('Enter second person\'s name: '),
    read(Person2),
    (nth_cousin(N, Person1, Person2) ->
        write(Person1), write(' and '), write(Person2), 
        write(' are '), write(N), write('th cousins.'), nl
    ;
        write(Person1), write(' and '), write(Person2), 
        write(' are not '), write(N), write('th cousins.'), nl
    ).

% Query for finding common ancestors
find_common_ancestors :-
    write('Enter first person\'s name: '),
    read(Person1),
    write('Enter second person\'s name: '),
    read(Person2),
    findall(Ancestor, common_ancestor(Person1, Person2, Ancestor), Ancestors),
    (Ancestors = [] ->
        write('No common ancestors found between '), write(Person1), 
        write(' and '), write(Person2), nl
    ;
        write('Common ancestors of '), write(Person1), write(' and '), 
        write(Person2), write(':'), nl,
        print_people(Ancestors)
    ).

% Query for finding generation level
find_generation_level :-
    write('Enter ancestor\'s name: '),
    read(Ancestor),
    write('Enter descendant\'s name: '),
    read(Descendant),
    (generation_level(Ancestor, Descendant, Level) ->
        write(Descendant), write(' is '), write(Level), 
        write(' generations below '), write(Ancestor), nl
    ;
        write(Descendant), write(' is not a descendant of '), write(Ancestor), nl
    ).

% Main menu
main_menu :-
    nl,
    write('Family Tree Query System'), nl,
    write('======================='), nl,
    write('1. Find children of a person'), nl,
    write('2. Find siblings of a person'), nl,
    write('3. Check if two people are cousins'), nl,
    write('4. Find all descendants of a person'), nl,
    write('5. Find nth cousins'), nl,
    write('6. Find common ancestors'), nl,
    write('7. Find generation level'), nl,
    write('8. Exit'), nl,
    write('Enter your choice (1-8): '),
    read(Choice),
    process_choice(Choice).

% Process user's choice
process_choice(1) :- find_children, main_menu.
process_choice(2) :- find_siblings, main_menu.
process_choice(3) :- check_cousins, main_menu.
process_choice(4) :- find_descendants, main_menu.
process_choice(5) :- find_nth_cousins, main_menu.
process_choice(6) :- find_common_ancestors, main_menu.
process_choice(7) :- find_generation_level, main_menu.
process_choice(8) :- write('Goodbye!'), nl, halt.
process_choice(_) :- write('Invalid choice. Please try again.'), nl, main_menu.

% Start the program
:- initialization(main_menu). 