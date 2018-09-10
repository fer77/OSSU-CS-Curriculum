7.1 Suppose we are working with the following DCG:

```
s --> foo,bar,wiggle.
foo --> [choo].
foo --> foo,foo.
bar --> mar,zar.
mar --> me,my.
me --> [i].
my --> [am].
zar --> blar,car.
blar --> [a].
car --> [train].
wiggle --> [toot].
wiggle --> wiggle,wiggle.
```

_Write down the ordinary Prolog rules that correspond to these DCG rules._

```
s --> foo, bar, wiggle.
s(A, D) :-
    foo(A, B),
    bar(B, C),
    wiggle(C, D).

foo --> [choo].
foo([choo | A], A).

foo --> foo, foo.
foo(A, C) :-
    foo(A, B),
    foo(B, C).

bar --> mar, zar.
bar(A, C) :-
    mar(A, B),
    zar(B, C).

mar --> me, my.
mar(A, C) :-
    me(A, B),
    my(B, C).

me --> [i].
me([i | A], A).

my --> [am].
my([am | A], A).

zar -> blar, car.
zar(A, C) :-
    blar(A, B),
    car(B, C).

blar -> [a].
blar([a | A], A).

car --> [train].
car([train | A], A).

wiggle --> [toot].
wiggle([toot | A], A).

wiggle --> wiggle, wiggle.
wiggle(A, C) :-
    wiggle(A, B),
    wiggle(B, C).
```

_What are the first three responses that Prolog gives to the query s(X,[])?_

```
?-  s(X,[]).
    X = [choo, i, am, a, train, toot] ;
    X = [choo, i, am, a, train, toot, toot] ;
    X = [choo, i, am, a, train, toot, toot, toot] ;
```

7.2 The formal language anbn 􏰃 􏰈ε􏰉 consists of all the strings in anbn ex- cept the empty string. Write a DCG that generates this language.

**nonterminals**

```
s --> l,r.
s --> l,s,r.
```

**terminals**

```
l --> [a].
r --> [b].
```

7.3 Let `anb2n` be the formal language which contains all strings of the following form: an unbroken block of as of length `n` followed by an unbroken block of `bs` of length `2n`, and nothing else. For example, `abb`, `aabbbb`, and `aaabbbbbb` belong to `anb2n`, and so does the empty string. Write a DCG that generates this language.

*nonterminals**

```
s --> [].
s --> l, s, r, r.
```

**terminals**

```
l --> [a].
r --> [b].
```