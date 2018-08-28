3.1 In the text, we discussed the predicate

```
descend(X,Y) :- child(X,Y).
descend(X,Y) :- child(X,Z),
                 descend(Z,Y).
```

Suppose we reformulated this predicate as follows:

```
descend(X,Y) :- child(X,Y).
descend(X,Y) :- descend(X,Z),
                 descend(Z,Y).
```

Would this be problematic?

3.2 Do you know these wooden Russian dolls (Matryoshka dolls) where the smaller ones are contained in bigger ones? Here is a schematic picture:

doll(Katarina,olga).
doll(olga,natasha).
doll(natasha,irina).

containedIn(X,Y) :- doll(X,Y).

containedIn(X,Y) :- doll(X,Z),
                 containedIn(Z,Y).