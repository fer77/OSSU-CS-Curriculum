6.1 Let's call a list doubled if it is made of two consecutive blocks of elements that are exactly the same. For example, [a,b,c,a,b,c] is doubled (it's made up of [a,b,c] followed by [a,b,c] ) and so is [foo,gubble,foo,gubble] . On the other hand, [foo,gubble,foo] is not doubled. Write a predicate doubled(List) which succeeds when List is a doubled list.

`doubled(List) :- append(X, X, List).`

 6.2 A palindrome is a word or phrase that spells the same forwards and backwards. For example, 'rotator', 'eve', and 'nurses run' are all palindromes. Write a predicate palindrome(List) , which checks whether List is a palindrome.

```
// accumulator:
accRev([H|T],A,R):- accRev(T,[H|A],R).
accRev([],A,A).

// initialise:
rev(L,R):- accRev(L,[],R).

// palindrome():
palindrome(List) :- rev(List, List).
```