## 1.1 Some Simple Examples
___

three basic constructs in Prolog: 
- facts, 
- rules, and 
- queries. 

A _collection of facts and rules_ is called a **knowledge base** (or a database).

## Knowledge Base 1
___

**Rules** state information that is conditionally true of the situation of interest.

## Knowledge Base 2
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

## Knowledge Base 3
___

The `,` is the logical conjunction `and`.

```
playsAirGuitar(vincent):-
   listens2Music(vincent),
   happy(vincent).
```

The `;` is the Prolog symbol for `or`.

## Knowledge Base 4
___

Any word beginning with an upper-case letter is a Prolog **variable**.

## Knowledge Base 5
___

