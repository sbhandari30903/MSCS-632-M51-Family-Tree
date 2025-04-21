# Family Tree Program in Prolog

This program implements a family tree system using Prolog, allowing users to query various family relationships through a user-friendly interface.

## Features

- Basic family relationships (parent, male, female)
- Derived relationships (siblings, cousins)
- Recursive relationships (ancestors, descendants)
- Advanced relationships (nth cousins, common ancestors)
- Generation level calculation
- Interactive query interface

## Files

- `family_tree.pl`: Contains the core family tree facts and relationship rules
- `family_queries.pl`: Provides the user interface for querying the family tree

## Requirements

- SWI-Prolog (version 9.0.4 or later recommended)

## Installation

1. Install SWI-Prolog:
   - On Ubuntu/Debian: `sudo apt-get install swi-prolog`
   - On Windows: Download from [SWI-Prolog website](https://www.swi-prolog.org/download/stable)
   - On macOS: `brew install swi-prolog`

2. Clone or download this repository

## Usage

1. Start the program:
```bash
swipl family_queries.pl
```

2. Use the interactive menu to perform queries:
   - 1. Find children of a person
   - 2. Find siblings of a person
   - 3. Check if two people are cousins
   - 4. Find all descendants of a person
   - 5. Find nth cousins
   - 6. Find common ancestors
   - 7. Find generation level
   - 8. Exit

3. When entering names, remember to:
   - Use exact case matching
   - Include the period (.) at the end of the name
   - Use names from the family tree

## Example Family Tree Structure

```
        john
       /    \
    mary    james
   /   \    /   \
robert patricia michael jennifer
      /  \    /  \      |
   david linda elizabeth barbara richard
```

## Available Relationships

### Basic Relationships
- `parent(X, Y)`: X is a parent of Y
- `male(X)`: X is male
- `female(X)`: X is female

### Derived Relationships
- `sibling(X, Y)`: X and Y are siblings
- `cousin(X, Y)`: X and Y are first cousins
- `grandparent(X, Y)`: X is a grandparent of Y

### Recursive Relationships
- `ancestor(X, Y)`: X is an ancestor of Y
- `descendant(X, Y)`: X is a descendant of Y
- `nth_cousin(N, X, Y)`: X and Y are Nth cousins
- `common_ancestor(X, Y, A)`: A is a common ancestor of X and Y
- `generation_level(A, D, L)`: D is L generations below A

## Example Queries

1. Find John's children:
```prolog
?- parent(john, Child).
```

2. Find Mary's siblings:
```prolog
?- sibling(mary, Sibling).
```

3. Check if Robert and Michael are cousins:
```prolog
?- cousin(robert, michael).
```

4. Find all descendants of John:
```prolog
?- descendant(Descendant, john).
```

5. Find second cousins:
```prolog
?- nth_cousin(2, X, Y).
```

6. Find common ancestors:
```prolog
?- common_ancestor(elizabeth, richard, Ancestor).
```

7. Find generation level:
```prolog
?- generation_level(john, elizabeth, Level).
```
