% Basic family relationships
% Facts about individuals and their genders
male(john).
male(james).
male(robert).
male(michael).
male(david).
male(richard).

female(mary).
female(patricia).
female(jennifer).
female(linda).
female(elizabeth).
female(barbara).

% Parent relationships
parent(john, mary).
parent(john, james).
parent(mary, robert).
parent(mary, patricia).
parent(james, michael).
parent(james, jennifer).
parent(patricia, david).
parent(patricia, linda).
parent(michael, elizabeth).
parent(michael, barbara).
parent(jennifer, richard).

% Derived relationships using rules

% Grandparent rule
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% Sibling rule
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

% Cousin rule
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2).

% Ancestor rule (recursive)
ancestor(X, Y) :-
    parent(X, Y).
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

% Descendant rule (recursive)
descendant(X, Y) :-
    ancestor(Y, X).

% Great-grandparent rule (recursive)
great_grandparent(X, Y) :-
    parent(X, Z),
    grandparent(Z, Y).

% Great-grandchild rule (recursive)
great_grandchild(X, Y) :-
    great_grandparent(Y, X).

% Nth cousin rule (recursive)
% Base case: first cousins
nth_cousin(1, X, Y) :-
    cousin(X, Y).

% Recursive case: nth cousins
nth_cousin(N, X, Y) :-
    N > 1,
    parent(P1, X),
    parent(P2, Y),
    N1 is N - 1,
    nth_cousin(N1, P1, P2).

% Nth cousin once removed (recursive)
% Base case: first cousin once removed
nth_cousin_once_removed(1, X, Y) :-
    parent(P, X),
    cousin(P, Y).

% Recursive case: nth cousin once removed
nth_cousin_once_removed(N, X, Y) :-
    N > 1,
    parent(P1, X),
    parent(P2, Y),
    N1 is N - 1,
    nth_cousin_once_removed(N1, P1, P2).

% Common ancestor rule (recursive)
common_ancestor(X, Y, Ancestor) :-
    ancestor(Ancestor, X),
    ancestor(Ancestor, Y).

% Closest common ancestor rule
closest_common_ancestor(X, Y, Ancestor) :-
    common_ancestor(X, Y, Ancestor),
    \+ (common_ancestor(X, Y, Other),
        ancestor(Other, Ancestor),
        Other \= Ancestor).

% Generation level (recursive)
% Base case: direct parent
generation_level(Parent, Child, 1) :-
    parent(Parent, Child).

% Recursive case: indirect ancestor
generation_level(Ancestor, Descendant, Level) :-
    parent(Parent, Descendant),
    generation_level(Ancestor, Parent, ParentLevel),
    Level is ParentLevel + 1.

% Example queries:
% To find children of a person:
% ?- parent(john, Child).
%
% To find siblings of a person:
% ?- sibling(mary, Sibling).
%
% To check if two people are cousins:
% ?- cousin(robert, michael).
%
% To find all descendants of a person:
% ?- descendant(Descendant, john).
%
% To find nth cousins:
% ?- nth_cousin(2, X, Y).
%
% To find common ancestors:
% ?- common_ancestor(elizabeth, richard, Ancestor).
%
% To find generation level:
% ?- generation_level(john, elizabeth, Level). 