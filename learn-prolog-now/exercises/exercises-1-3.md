1.1 Which of the following sequences of characters are atoms, which are variables, and which are neither?

1. vINCENT (atom)
2. Footmassage (variable)
3. variable23 (atom)
4. Variable2000 (variable)
5. big_kahuna_burger (atom)
6. 'big  kahuna  burger' (atom)
7. big  kahuna  burger (neither)
8. 'Jules' (atom)
9. _Jules (variable)
10. '_Jules' (atom)

1.2 Which of the following sequences of characters are atoms, which are variables, which are complex terms, and which are not terms at all? Give the functor and arity of each complex term.

1. loves(Vincent,mia) (complex term) functor: `loves` arity(2): `Vincent & mia`
2. ’loves(Vincent,mia)’ (atom?)
3. Butch(boxer) (not a term at all)
4. boxer(Butch) (complex term) functor: `boxer` arity(1): `Butch`
5. and(big(burger),kahuna(burger)) (complex term), functor: and, arity: 2
6. and(big(X),kahuna(X)) (complex term), functor: and, arity: 2
7. _and(big(X),kahuna(X)) (not a term at all)
8. (Butch  kills  Vincent) (not a term at all)
9. kills(Butch  Vincent) (not a term at all)
10. kills(Butch,Vincent (not a term at all)

1.3 How many facts, rules, clauses, and predicates are there in the following knowledge base? What are the heads of the rules, and what are the goals they contain?

```
woman(vincent).
woman(mia).
man(jules).
person(X):- man(X); woman(X).
loves(X,Y):- father(X,Y).
father(Y,Z):- man(Y), son(Z,Y).
father(Y,Z):- man(Y), daughter(Z,Y).
```

7 clauses and predicates, 4 rules, 3 facts.

Head:
`person(X)`, `loves(X,Y)`, `ather(Y,Z)`, `father(Y,Z)`

Goals:
`man(X); woman(X)`, `father(X,Y)`, `man(Y), son(Z,Y)`, `man(Y), daughter(Z,Y)`

1.4 Represent the following in Prolog:

1. Butch is a killer. killer(butch)
2. Mia and Marsellus are married. married(mia, marcellus)
3. Zed is dead. dead(zed)
4. Marsellus kills everyone who gives Mia a footmassage. kills(marcellus, X) :- givesFootMassage(X, mia)
5. Mia loves everyone who is a good dancer. miaLoves(mia, X) :- goodDancer(X)
6. Jules eats anything that is nutritious or tasty. eats(jules, X) :- nutritious(X); tasty(X)

1.5 Suppose we are working with the following knowledge base:

```
wizard(ron).
hasWand(harry).
quidditchPlayer(harry).
wizard(X):- hasBroom(X), hasWand(X).
hasBroom(X):- quidditchPlayer(X).
```

How does Prolog respond to the following queries?

1. wizard(ron). yes
2. witch(ron). undefined
3. wizard(hermione). no
4. witch(hermione). undefined
5. wizard(harry). yes
6. wizard(Y). ron  harry
7. witch(Y). undefined