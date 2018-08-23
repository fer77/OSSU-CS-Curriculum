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
