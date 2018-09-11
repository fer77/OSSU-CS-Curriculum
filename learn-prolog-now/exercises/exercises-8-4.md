8.1 Here’s our basic DCG. s --> np,vp.

```
np --> det,n.
vp --> v,np.
vp --> v.
det --> [the].
det --> [a].
n --> [woman].
n --> [man].
v --> [shoots].
```

Suppose we add the noun "men" (which is plural) and the verb "shoot". Then we would want a DCG which says that "The men shoot" is ok, ‘The man shoots" is ok, "The men shoots" is not ok, and "The man shoot" is not ok. Change the DCG so that it correctly handles these sentences. Use an extra argument to cope with the singular/plural distinction.

```
s --> np, vp.
np(np(DET,N)) --> det(DET),n(N).
vp(vp(V,NP)) --> v(V),np(NP). vp(vp(V)) --> v(V).
det --> [the].
det --> [a].
n --> [woman].
n --> [man].
v --> [shoots].
```

8.2 Translate the following DCG rule into the form Prolog uses: 

```
kanga(V, R, Q) --> roo(V, R), jumps(Q, Q), { marsupial(V, R, Q) }.
```

```
kanga(V, R, Q, A, C) :- roo(V, R, A, B),
                        jumps(Q, Q, B, C),
                        marsupial(V, R, Q).
```
