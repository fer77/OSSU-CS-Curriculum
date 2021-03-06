2.1 Which of the following pairs of terms unify? Where relevant, give the variable instantiations that lead to successful unification.

1. `bread  =  bread`, yes
2. `’Bread’  =  bread`, no
3. `’bread’  =  bread`, yes
4. `Bread  =  bread`, yes
5. `bread  =  sausage`, no
6. `food(bread)  =  bread`, no
7. `food(bread)  =  X`, yes
8. `food(X)  =  food(bread)`, no
9. `food(bread,X)  =  food(Y,sausage)`, yes. X = sausage; Y = bread.
10. `food(bread,X,beer)  =  food(Y,sausage,X)`, no
11. `food(bread,X,beer)  =  food(Y,kahuna_burger)`, no
12. `food(X)  =  X`, yes
13. `meal(food(bread),drink(beer))  =  meal(X,Y)`, yes. X = food(bread); Y = drink(beer).
14. `meal(food(bread),X)  =  meal(X,drink(beer))`, no

2.2 We are working with the following knowledge base:

```
house_elf(dobby).
witch(hermione).
witch('McGonagall').
witch(rita_skeeter).
magic(X):- house_elf(X).
magic(X):- wizard(X).
magic(X):- witch(X).
```

Which of the following queries are satisfied? Where relevant, give all the variable instantiations that lead to success.

1. `?-  magic(house_elf).`, false
2. ?-  wizard(harry)., 
3. ?-  magic(wizard).
4. ?-  magic(’McGonagall’).
5. ?-  magic(Hermione).

Draw the search tree for the query magic(Hermione) .

2.3 Here is a tiny lexicon (that is, information about individual words) and a mini grammar consisting of one syntactic rule (which defines a sentence to be an entity consisting of five words in the following order: a determiner, a noun, a verb, a determiner, a noun).

```
word(determiner,a).
word(determiner,every).
word(noun,criminal).
word(noun,'big kahuna burger').
word(verb,eats).
word(verb,likes).

sentence(Word1,Word2,Word3,Word4,Word5):-
   word(determiner,Word1),
   word(noun,Word2),
   word(verb,Word3),
   word(determiner,Word4),
   word(noun,Word5).
```
What query do you have to pose in order to find out which sentences the grammar can generate? List all sentences that this grammar can generate in the order that Prolog will generate them in.

sentence(A, B, C, D, E). generates all answers.

```
A = D, D = a,
B = E, E = criminal,
C = eats
```

2.4 Here are six Italian words:

>astante , astoria , baratto , cobalto , pistola , statale.

They are to be arranged, crossword puzzle fashion, in the following grid:

*Pic not found*

The following knowledge base represents a lexicon containing these words:

```
word(astante, a,s,t,a,n,t,e).
word(astoria, a,s,t,o,r,i,a).
word(baratto, b,a,r,a,t,t,o).
word(cobalto, c,o,b,a,l,t,o).
word(pistola, p,i,s,t,o,l,a).
word(statale, s,t,a,t,a,l,e).
```

Write a predicate crossword/6 that tells us how to fill in the grid. The first three arguments should be the vertical words from left to right, and the last three arguments the horizontal words from top to bottom.

crossword(V1,V2,V3,H1,H2,H3):- word(V1, V11, V12, V13, V14, V15, V16, V17),
                               word(V2, V21, V22, V23, V24, V25, V26, V27),
                               word(V3, V31, V32, V33, V34, V35, V36, V37),
                               word(H1, H11, V12, H13, V22, H15, V32, H17),
                               word(H2, H21, V14, H23, V24, H25, V34, H27),
                               word(H3, H31, V16, H33, V26, H35, V36, H37).
