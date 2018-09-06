6.1 Let's call a list doubled if it is made of two consecutive blocks of elements that are exactly the same. For example, [a,b,c,a,b,c] is doubled (it's made up of [a,b,c] followed by [a,b,c] ) and so is [foo,gubble,foo,gubble] . On the other hand, [foo,gubble,foo] is not doubled. Write a predicate doubled(List) which succeeds when List is a doubled list.

`doubled(List) :- append(X, X, List).`

6.2 A palindrome is a word or phrase that spells the same forwards and backwards. For example, 'rotator', 'eve', and 'nurses run' are all palindromes. Write a predicate palindrome(List) , which checks whether List is a palindrome.

```
// accumulator:
accRev([H|T],A,R) :- accRev(T,[H|A],R).
accRev([],A,A).

// initialise:
rev(L,R) :- accRev(L,[],R).

// palindrome():
palindrome(List) :- rev(List, List).
```

6.3 Write a predicate `toptail(InList,OutList)` which says no if InList is a list containing fewer than 2 elements, and which deletes the first and the last elements of InList and returns the result as OutList , when InList is a list containing at least 2 elements.

```
toptail(InList, OutList) :- append([_|OutList],[_], InList).
```

6.4 Write a predicate `last(List,X)` which is true only when List is a list that contains at least one element and `X` is the last element of that list. Do this in two different ways:

1. Define last/2 using the predicate rev/2 discussed in the text.

```
// accumulator:
accRev([H|T],A,R) :- accRev(T,[H|A],R).
accRev([],A,A).

// initialise:
rev(L,R) :- accRev(L,[],R).

last(List, X) :- rev(List, [X|_]).
```

2. Define last/2 using recursion.

```
last([X], X).
last([_|T], X) :- last(T, X).
```

6.6 Here is an exercise for those of you who like logic puzzles.

There is a street with three neighbouring houses that all have a different colour, namely red, blue, and green. People of different nationalities live in the different houses and they all have a different pet. Here are some more facts about them:

- The Englishman lives in the red house.
- The jaguar is the pet of the Spanish family.
- The Japanese lives to the right of the snail keeper.
- The snail keeper lives to the left of the blue house.

Who keeps the zebra? Don’t work it out for yourself: define a predicate zebra/1 that tells you the nationality of the owner of the zebra!

```
prefix(P, L) :-
    append(P, _, L).
suffix(S, L) :-
    append(_, S, L).
sublist(SubL, L) :-
    suffix(S, L),
    prefix(SubL, S).

zebra(X) :-
    member(house(red, english, _), [H0,H1,H2]),
    member(house(_, spanish, jaguar), [H0,H1,H2]),
    sublist([house(_, _, snail), house(_, japanese, _)], [H0,H1,H2]),
    sublist([house(_, _, snail), house(blue, _, _)], [H0,H1,H2]),
    member(house(_, X, zebra), [H0,H1,H2]).
```

?- zebra(japanese).
?- true