9.1 Which of the following queries succeed, and which fail?

```
   ?-  12  is  2*6. true,
    
   ?-  14  =\=  2*6. true,
    
   ?-  14  =  2*7. false,
    
   ?-  14  ==  2*7. false(=:=),
    
   ?-  14  \==  2*7. true,
    
   ?-  14  =:=  2*7. true,
    
   ?-  [1,2,3|[d,e]]  ==  [1,2,3,d,e]. true,
    
   ?-  2+3  ==  3+2. false,
    
   ?-  2+3  =:=  3+2. true,
    
   ?-  7-2  =\=  9-2. true,
    
   ?-  p  ==  'p'. true,
    
   ?-  p  =\=  'p'. err,
    
   ?-  vincent  ==  VAR. false,
    
   ?-  vincent=VAR,  VAR==vincent. VAR = vincent
```

9.2 How does Prolog respond to the following queries?

   ?-  .(a,.(b,.(c,[])))  =  [a,b,c]. yes
    
   ?-  .(a,.(b,.(c,[])))  =  [a,b|[c]]. yes
    
   ?-  .(.(a,[]),.(.(b,[]),.(.(c,[]),[])))  =  X. -> X = [[a], [b], [c]].
    
   ?-  .(a,.(b,.(.(c,[]),[])))  =  [a,b|[c]]. false

9.3 Write a two-place predicate termtype(Term,Type) that takes a term and gives back the type(s) of that term (atom, number, constant, variable, and so on). The types should be given back in the order of their generality. The predicate should behave in the following way.

`%% simple terms`
termtype(Term,atom) :-
  atom(Term).
termtype(Term,integer) :-
  integer(Term).
termtype(Term,number) :-
  number(Term).
termtype(Term,constant) :-
  atomic(Term).
termtype(Term,variable) :-
  var(Term).

`%% complex term`
termtype(Term,complex_term) :-
  nonvar(Term),
  functor(Term,_,A),
  A > 0.

`%% simple term`
termtype(Term,simple_term) :-
  termtype(Term,variable).
termtype(Term,simple_term) :-
  termtype(Term,constant).


9.4 Write a Prolog program that defines the predicate groundterm(Term) which tests whether or not Term is a ground term. Ground terms are terms that don’t contain variables. Here are examples of how the predicate should behave:

?-  groundterm(X). 
no 
?-  groundterm(french(bic_mac,le_bic_mac)). 
yes 
?-  groundterm(french(whopper,X)). 
no

```groundterm(Term) :-
  nonvar(Term),
  Term =.. [_ | X],
  groundterm_in_list(X).

groundterm_in_list([H|T]) :-
  groundterm(H),
  groundterm_in_list(T).

groundterm_in_list([]).
```

9.5 Assume that we have the following operator definitions.

```
   :-  op(300,  xfx,  [are,  is_a]). 
   :-  op(300,  fx,  likes). 
   :-  op(200,  xfy,  and). 
   :-  op(100,  fy,  famous).
```

Which of the following are well-formed terms? What are the main operators? Give the bracketings.

?- X is_a witch. -> true.
%% ?- harry and ron and hermione are friends. -> true
%% ?- harry is_a wizard and likes quidditch. -> false
%% ?- dumbledore is_a famous famous wizard. -> true

%% is_a(X, witch).
%% are(and(harry, and(ron, hermione)), friends).
%% is_a(dumbledore, famous(famous(wizard))).