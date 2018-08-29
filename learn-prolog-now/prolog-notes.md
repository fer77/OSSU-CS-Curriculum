# Chapter 1 
# Facts, Rules, and Queries
## 1.1 Some Simple Examples
___

three basic constructs in Prolog: 
- facts, 
- rules, and 
- queries. 

A _collection of facts and rules_ is called a **knowledge base** (or a database).

### Knowledge Base 1
___

**Rules** state information that is conditionally true of the situation of interest.

### Knowledge Base 2
___

```
happy(yolanda).
listens2Music(mia).
listens2Music(yolanda):- happy(yolanda).
playsAirGuitar(mia):- listens2Music(mia).
playsAirGuitar(yolanda):- listens2Music(yolanda).
```
The `:-` should be read as "if", or "is implied by". The part to the left of the `:-` is called the _head of the rule_, the part on the right hand side is called the _body_. So in general rules say: 

>if the body of the rule is true, then the head of the rule is true too.

If a _knowledge base_ contains a rule head  `:-`  _body_, and Prolog knows that _body_ follows from the information in the _knowledge base_, then Prolog can infer head.

This fundamental deduction step is called **modus ponens**

### Knowledge Base 3
___

The `,` is the logical conjunction `and`.

```
playsAirGuitar(vincent):-
   listens2Music(vincent),
   happy(vincent).
```

The `;` is the Prolog symbol for `or`.

### Knowledge Base 4
___

Any word beginning with an upper-case letter is a Prolog **variable**.

### Knowledge Base 5
___

## 1.2 Prolog Syntax
___

_facts_, _rules_, and _queries_ are built out of **terms**

There are four kinds of _term_ in Prolog: 
- atoms, 
- numbers, 
- variables, and 
- complex terms (or structures). 

_Atoms_ and _numbers_ are lumped together as _constants_, and _constants_ and _variables_ together make up the simple terms of Prolog.

### Atoms

An **atom** is one of:

1. A _string_ of characters made up of upper-case letters, lower-case letters, digits, and the underscore character, that begins with a lower-case letter. Here are some examples: 

```
butch
big_kahuna_burger
listens2Music
playsAirGuitar
```

2. An _arbitrary sequence_ of characters enclosed in single quotes. For example:

```
’ Vincent ’
’ The  Gimp ’
’ Five_Dollar_Shake ’
 ’ &^%&#@$  &* ’
 ’   ’
 ```
 
 The sequence of characters between the single quotes is called the **atom name**. Note that we are allowed to use spaces in such atoms; in fact, a common reason for using single quotes is so we can do precisely that.

3. A _string_ of special characters. Here are some examples: 

```
@=
====>
;
:-
```

are all atoms. As we have seen, some of these atoms, such as `;` and `:-` have a pre-defined meaning.

### Numbers

Real numbers aren’t particularly important in typical Prolog applications. Prolog implementations do support floating point numbers or floats (1657.3087 or π).

But integers (…,-2, -1, 0, 1, 2, 3,…) are useful for counting the elements of a list.

### Variables

A _variable_ is a string of upper-case letters, lower-case letters, digits and underscore characters that starts either with an upper-case letter or with an underscore.

```
X
Y
Variable
_tag
X_526
List
List24
_head
Tail
_input
Output
```

### Complex terms

_Constants_, _numbers_, and _variables_ are the building blocks. **Complex terms** are often called _structures_.

_Complex terms_ are build out of:

- a functor followed by 
- a sequence of arguments. 

_Arguments_ are put in ordinary parentheses, separated by commas, and placed after the _functor_. The _functor_ has to be directly followed by the parenthesis; you can’t have a space between the _functor_ and the parenthesis enclosing the arguments. The _functor_ must be an _atom_. _Variables_ cannot be used as _functors_. _Arguments_ can be any kind of term.
For example:

```
playsAirGuitar(jody)
```

is a _complex term_: its _functor_ is `playsAirGuitar` and its _argument_ is `jody`.

Prolog allows the use of recursive structures:

```
hide(X,father(father(father(butch))))
```

The number of arguments that a complex term has is called its **arity**. For example, `woman(mia)` is a complex term of _arity_ 1, and `loves(vincent,mia)` is a complex term of _arity_ 2.

When we need to talk about _predicates_ and how we intend to use them it is usual to use a suffix `/` followed by a number to indicate the predicate’s _arity_.

```
listens2Music
happy
playsAirGuitar
```

Define predicates

```
listens2Music/1
happy/1
playsAirGuitar/1
```

Prolog won't get confused about a knowledge base containing the two different love predicates, for it regards the `love/2` predicate and the `love/3` predicate as distinct.

# Chapter 2 
# Unification and Proof Search

## 2.1 Unification
___

Two terms _unify_ if they are the same term or if they contain variables that can be _uniformly_ instantiated with terms in such a way that the resulting terms are equal.

This means, for example, that the terms `mia` and `mia` _unify_, because they are the same atom. Similarly, the terms `42` and `42` _unify_, because they are the same number, the terms `X` and `X` _unify_, because they are the same variable, and the terms `woman(mia)` and `woman(mia)` _unify_, because they are the same complex term. The terms `woman(mia)` and `woman(vincent)` , however, do not _unify_, as they are not the same (and neither of them contains a variable that could be instantiated to make them the same).

The terms `mia` and `X` ? They are not the same. However, the variable `X` can be instantiated to `mia` which makes them equal.

 This tells us not only which terms Prolog will unify, but also what it will do to the variables to achieve this.

1. If term1 and term2 are constants, then term1 and term2 unify if and only if they are the same atom, or the same number.
2. If term1 is a variable and term2 is any type of term, then term1 and term2 unify, and term1 is instantiated to term2 . Similarly, if term2 is a variable and term1 is any type of term, then term1 and term2 unify, and term2 is instantiated to term1 . (So if they are both variables, they’re both instantiated to each other, and we say that they share values.)
3. If term1 and term2 are complex terms, then they unify if and only if:

    a. They have the same functor and arity, and

    b. all their corresponding arguments unify, and

    c. the variable instantiations are compatible. (For example, it is not possible to instantiate variable X to mia when unifying one pair of arguments, and to instantiate X to vincent when unifying another pair of arguments .)

4. Two terms unify if and only if it follows from the previous three clauses that they unify.

### Examples
___

The `=/2` predicate tests whether its two arguments unify. 

### The occurs check
___

Prolog comes with a built-in predicate that carries out standard unification (that is, unification with the occurs check). The predicate is

`unify_with_occurs_check/2.` So if we posed the query `?-unify_with_occurs_check(father(X),X).` we would get _no_.

### Programming with unification
___

## 2.2 Proof Search
___

 Prolog tries to satisfy queries one by one, working through the list in a left to right (->) direction.

 Points in the search where there are several alternative ways of unifying a goal against the knowledge base are called **choice points**. Prolog keeps track of _choice points_ it has encountered, so that if it makes a wrong choice it can retreat to the previous _choice point_ and try something else instead. This process is **called backtracking**.

# Chapter 3 
# Recursion

## 3.1 Recursive Definitions
___

A _predicate_ is recursively defined if one or more rules in its definition refers to itself.

The word _declarative_ is used to talk about the logical meaning of Prolog knowledge bases. That is, the declarative meaning of a Prolog knowledge base is simply _what it says_, or _what it means, if we read it as a collection of logical statements_. 

## 3.2 Rule Ordering, Goal Ordering, and Termination
___

When it comes to non-terminating programs, rule ordering changes can lead to some extra solutions being found. Goal ordering, not rule ordering, is what is truly procedurally significant.

>_thinking declaratively_ is thinking in terms of describing the problem accurately.

# Chapter 4 
# Lists

## 4.1 Lists
___

Lists:

```
[mia, vincent, jules, yolanda] // list of length four
[mia, robber(honey_bunny), X, 2, mia] // all sorts of Prolog objects can be elements of a list
                                      //  items may occur more than once in the same list
[]
[mia, [vincent, jules], [butch, girlfriend(butch)]] // lists can contain other lists as elements
[[], dead(z), [2, [b, c]], [], Z, [2, [b, c]]]
```

Any non-empty list consists of two parts: the **head** and the **tail**. The **head** is simply the first item in the list; the **tail** is everything else.

The built-in operator `|` can be used to _decompose_ a list into its _head_ and _tail_.

Only non-empty lists have heads and tails. If we try to use | to pull [] apart, Prolog will fail:

```
?- [X|Y] = [].
no
```

The `_` underscore symbol is an **anonymous variable**. It is used when we need a variable, but we’re not interested in what Prolog instantiates the variable to.

```
?- [_,X,_,Y|_] = [[], dead(z), [2, [b, c]], [], Z].

X = dead(z)
Y = []
Z = _9593
yes
```

## 4.2 Member

