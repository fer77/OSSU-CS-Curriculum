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

**member**:

```
member(X,[X|T]).
member(X,[H|T]) :- member(X,T).
```

we can rewrite member/2 as follows:

```
member(X,[X|_]).
member(X,[_|T]) :- member(X,T).
```

This version is exactly the same, both declaratively and procedurally. But it’s just a little bit clearer: when you read it, you are forced to concentrate on what is essential.

## 4.3 Recursing down Lists

# Chapter 5 
# Arithmetic

## 5.1 Arithmetic in Prolog

Prolog understands the usual conventions we use for disambiguating arithmetical expressions.

## 5.2 A Closer Look

The most important thing to understand is: `+, *, -, ÷` and `mod` do not carry out any arithmetic. In fact, expressions (3+2 , 3-2 and 3*2) are simply **terms**. The **functors** of these terms are `+ , -` and `*` respectively, and the arguments are `3` and `2` . Apart from the fact that the functors go between their arguments (instead of in front of them) these are ordinary Prolog terms, and unless we do something special, Prolog will not actually do any arithmetic.

To force Prolog to actually evaluate arithmetic expressions we have to use `is`

**is** sends a signal to Prolog that says "Don’t treat the given expression as a complex term! Call up your built-in arithmetic capabilities and carry out the calculations!"

Arithmetic expressions to be evaluated must be on the right hand side of `is`:

```
?- X is 6+2.

X = 8
```

## 5.3 Arithmetic and Lists

_tail recursive_ programs have less bookkeeping overhead, and this makes them more efficient.

## 5.4 Comparing Integers

Note `=` tries to unify its arguments; it does not evaluate them. That's `=:=` 's role:

```
?- 4=4.
yes

?- 2+2 =4.
no

?- 2+2 =:= 4.
yes
```

# Chapter 6 
# More Lists

## 6.1 Append

## Defining append

`append/3`:

```
append([],L,L).
append([H|T],L2,[H|L3]) :- append(T,L2,L3).
```

`append/3` is a recursive definition. The base case states that appending an empty list to any list yields that same list.

The recursive step states that when we concatenate a non-empty list `[H|T]` with a list `L2`, the result is a list whose head is `H` and tail is the result of concatenating `T` with `L2`.

## Using append

## 6.2 Reversing a list

## Naive reverse using append

The predicate spends most of its time in the recursive calls to append, making it very hard to see what is going on

## Reverse using an accumulator

The idea is simply to push each element onto the head of the accumulator, like this:

```
List: [a,b,c,d]
List: [b,c,d]
List: [c,d]
List: [d]
List: []
Accumulator: [] 
Accumulator: [a] 
Accumulator: [b,a] 
Accumulator: [c,b,a] 
Accumulator: [d,c,b,a]
```

At the start, the accumulator will be `[]`. Take the head of the list and add it as the head of the accumulator. Carry on processing the tail, by reversing `[b,c,d]`, and the accumulator is `[a]`. Again, take the head of the list we are trying to reverse and add it as the head of the accumulator (this way our new accumulator is `[b,a]`) and carry on trying to reverse [c,d]. Using the same idea, we get a new accumulator `[c,b,a]`, and try to reverse `[d]`. The next step yields an accumulator `[d,c,b,a]` and the new goal of trying to reverse `[]`.

accumulator code:

```
accRev([H|T],A,R) :- accRev(T,[H|A],R). accRev([],A,A).
```

initialization of the accumulator:

```
rev(L,R) :- accRev(L,[],R).
```

# Chapter 7 
# Definite Clause Grammars

## 7.1 Context free grammars

**context free grammars** (or CFGs): a finite collection of rules which tell us that certain sentences are grammatical (that is, syntactically correct) and what their grammatical structure actually is.

**context free grammar** is a finite collection of rules which tell us that certain sentences are grammatical (that is, syntactically correct) and what their grammatical structure actually is.

```
s -> np vp
np -> det n
vp -> v np
vp -> v
det -> a det -> the n -> woman n -> man
v -> shoots
```

symbols:

 `->`, used to define the rules

 **non-terminal symbols**: `s, np, vp, det, n, v`

 - `s` is short for sentence, 
 - `np` is short for noun phrase, 
 - `vp` is short for verb phrase, and 
 - `det` is short for determiner. 
 
 **terminal symbols** (or: the alphabet): `a`, `the`, `woman`, `man`, and `shoots`.

 A **context free recognizer** is a program which correctly tells us whether or not a string belongs to the language generated by a **context free grammar**. To put it another way, a recognizer is a program that correctly classifies strings as _grammatical_ or _ungrammatical_ (relative to some grammar).

 a **context free language** is a language that can be generated by a **context free grammar**.

 ## CFG recognition using append

**clause grammars**, Prolog's inbuilt grammar tool.

##CFG recognition using difference lists

## 7.2 Definite clause grammars

## A first example

## Adding recursive rules

## A DCG for a simple formal language

# Chapter 8
# More Definite Clause Grammars

## 8.1 Extra arguments

## Context free grammars with features

## Building parse trees

## 8.2 Extra goals

## Separating rules and lexicon

**First argument indexing** is a technique for making Prolog’s knowledge base access more efficient.

## 8.3 Concluding remarks

# 9 A Closer Look at Terms

## 9.1 Comparing terms

## 9.2 Terms with a Special Notation

`=`	The unification predicate.
Succeeds if it can unify its arguments, fails otherwise.

`\=` The negation of the unification predicate.
Succeeds if `=` fails, and vice-versa.

`==` The identity predicate.
Succeeds if its arguments are identical, fails otherwise.

`\==` The negation of the identity predicate.
Succeeds if `==` fails, and vice-versa.

`=:=` The arithmetic equality predicate.
Succeeds if its arguments evaluate to the same integer.

`=\=` The arithmetic inequality predicate.
Succeeds if its arguments evaluate to different integers.

## 9.3 Examining Terms

### Types of Terms

`atom/1`	Is the argument an atom?
`integer/1`	Is the argument an integer?
`float/1`	Is the argument a floating point number?
`number/1`	Is the argument an integer or a floating point number?
`atomic/1`	Is the argument a constant?
`var/1`	Is the argument an uninstantiated variable?
`nonvar/1`	Is the argument an instantiated variable or another term that is not an un instantiated variable?

### The Structure of Terms

### Strings

## 9.4 Operators

### Properties of operators

**infix operators** functors that can be written between arguments:

```
:- , --> , ; , ’,’ , = , =.. , == and so on...
```

**prefix operators** written before their arguments.

**postfix operators** written after.

In Prolog, **precedence** is expressed by a number between `0` and `1200`; the higher the number, the greater the **precedence**.

### Defining operators

Operator definitions in Prolog look like this:

> :-  op(Precedence,Type,Name).

`+` this atom is `yfx`, which says that `+` is an _infix operator_; `f` represents the operator, and the `x` and `y` the _arguments_. `x` stands for an argument which has a precedence which is lower than the precedence of `+` and `y` stands for an argument which has a precedence which lower or equal to the precedence of `+` . There are the following possibilities for type:


- infix     xfx , xfy , yfx
- prefix	fx , fy
- suffix	xf , yf