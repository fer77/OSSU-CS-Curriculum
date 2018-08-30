4.1 How does Prolog respond to the following queries?

1. [a,b,c,d]  =  [a,[b,c,d]]. false
2. [a,b,c,d]  =  [a|[b,c,d]]. true
3. [a,b,c,d]  =  [a,b,[c,d]]. false
4. [a,b,c,d]  =  [a,b|[c,d]]. true
5. [a,b,c,d]  =  [a,b,c,[d]]. false
6. [a,b,c,d]  =  [a,b,c|[d]]. ture
7. [a,b,c,d]  =  [a,b,c,d,[]]. false
8. [a,b,c,d]  =  [a,b,c,d|[]]. true
9. []  =  _. ture
10. []  =  [_]. false
11. []  =  [_|[]]. false

4.2 Which of the following are syntactically correct lists? If the representation is correct, how many elements does the list have?

1. [1|[2,3,4]]. correct, 4 elem
2. [1,2,3|[]]. correct, 3 elem
3. [1|2,3,4]. nope
4. [1|[2|[3|[4]]]]. correct, 4 elem
5. [1,2,3,4|[]]. correct, 4 elem
6. [[]|[]]. correct, 1 elem
7. [[1,2]|4]. nope
8. [[1,2],[3,4]|[5,6,7]] correct, elem

4.3 Write a predicate second(X,List) which checks whether X is the second element of List.

`second(X, list) :- List = [_, X|_].`

4.4 Write a predicate `swap12(List1,List2)` which checks whether `List1` is identical to `List2` , except that the first two elements are exchanged.

4.5 Write a predicate swap12(List1,List2) which checks whether List1 is identical to List2 , except that the first two elements are exchanged.

`swap12(List1, List2) :- List1 = [List1a, List1b | T], List2 = [List1b, List1a | T].`

4.5 Suppose we are given a knowledge base with the following facts:

```
tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).
```

Write a predicate listtran(G,E) which translates a list of German number words to the corresponding list of English number words. For example:

```
listtran([eins,neun,zwei],X).
```

should give:

`X = [one,nine,two].`

Your program should also work in the other direction. For example, if you give it the query

`?- listtran(X,[one,seven,six,two]).`

it should return:

`X = [eins,sieben,sechs,zwei].`

```
listtran([], []).
listtran([Xh | Xt], [Yh | Yt]) :- tran(Xh, Yh),
                                  listtran(Xt, Yt).
```