## Starting Out

Haskell has a static type system. The type of every expression is known at compile time

### An intro to lists
___

**homogenous** integers or charachters, but not both.

_++_ vs _:_  `:` takes a number and a list of numbers or a character and a list of characters, whereas `++` takes two lists. I
nternally, Haskell has to walk through the whole list on the left side of `++`. That's not a problem when dealing with lists that aren't too big. But putting something at the end of a list that's fifty million entries long is going to take a while. However, putting something at the beginning of a list using the `:` operator (also called the cons operator) is instantaneous.

**head** takes a list and returns its head. The head of a list is basically its first element.

```
ghci> head [5,4,3,2,1]  
5
```

**tail** takes a list and returns its tail. In other words, it chops off a list's head.

```
ghci> tail [5,4,3,2,1]  
[4,3,2,1]
```

**last** takes a list and returns its last element.

```
ghci> last [5,4,3,2,1]  
1
```

**init** takes a list and returns everything except its last element.

```
ghci> init [5,4,3,2,1]  
[5,4,3,2]
```

**length** takes a list and returns its length, obviously.

```
ghci> length [5,4,3,2,1]  
5 
```

**null** checks if a list is empty. If it is, it returns True, otherwise it returns False. Use this function instead of `xs == []` (if you have a list called xs)

```
ghci> null [1,2,3]  
False  
ghci> null []  
True 
```

**reverse** reverses a list.

```
ghci> reverse [5,4,3,2,1]  
[1,2,3,4,5]  
```

**take** takes number and a list. It extracts that many elements from the beginning of the list. Watch.

```
ghci> take 3 [5,4,3,2,1]  
[5,4,3]  
ghci> take 1 [3,9,3]  
[3]  
ghci> take 5 [1,2]  
[1,2]  
ghci> take 0 [6,6,6]  
[]  
```

**drop** works in a similar way, only it drops the number of elements from the beginning of a list.

```
ghci> drop 3 [8,4,2,1,5,6]  
[1,5,6]  
ghci> drop 0 [1,2,3,4]  
[1,2,3,4]  
ghci> drop 100 [1,2,3,4]  
[]  
```

**maximum** takes a list of stuff that can be put in some kind of order and returns the biggest element.

**minimum** returns the smallest.

```
ghci> minimum [8,4,2,1,5,6]  
1  
ghci> maximum [1,9,2,3,4]  
9   
```

**sum** takes a list of numbers and returns their sum.

**product** takes a list of numbers and returns their product.

```
ghci> sum [5,2,1,6,3,2,5,7]  
31  
ghci> product [6,2,1,2]  
24  
ghci> product [1,2,5,6,7,9,2,0]  
0   
```

**elem** takes a thing and a list of things and tells us if that thing is an element of the list. It's usually called as an infix function because it's easier to read that way.

```
ghci> 4 `elem` [3,4,5,6]  
True  
ghci> 10 `elem` [3,4,5,6]  
False  
```

### Texas ranges

```
ghci> [1..20]  
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]  
ghci> ['a'..'z']  
"abcdefghijklmnopqrstuvwxyz"  
ghci> ['K'..'Z']  
"KLMNOPQRSTUVWXYZ" 

ghci> [2,4..20]  
[2,4,6,8,10,12,14,16,18,20]  
ghci> [3,6..20]  
[3,6,9,12,15,18]   

[20,19..1]
```

**cycle** takes a list and cycles it into an infinite list. If you just try to display the result, it will go on forever so you have to slice it off somewhere.

```
ghci> take 10 (cycle [1,2,3])  
[1,2,3,1,2,3,1,2,3,1]  
ghci> take 12 (cycle "LOL ")  
"LOL LOL LOL " 
```

**repeat** takes an element and produces an infinite list of just that element. It's like cycling a list with only one element.

```
ghci> take 10 (repeat 5)  
[5,5,5,5,5,5,5,5,5,5]  
```

Although it's simpler to just use the **replicate** function if you want some number of the same element in a list. replicate `3 10` returns `[10,10,10]`.

### I'm a list comprehension
___

**comprehension** `[x*2 | x <- [1..10]]`

**condition** `[x*2 | x <- [1..10], x*2 >= 12]`

**filtering** weeding out lists by predicates.

### Tuples
___

**tuples** are a way to store several values into a single value without having to be homogenous. A tuple can contain a combination of several types.

**fst** takes a pair and returns its first component.

```
ghci> fst (8,11)  
8  
ghci> fst ("Wow", False)  
"Wow" 
```

**snd** takes a pair and returns its second component. Surprise!

```ghci> snd (8,11)  
11  
ghci> snd ("Wow", False)  
False 
```

**zip** takes two lists and then zips them together into one list by joining the matching elements into pairs. 

```
ghci> zip [1,2,3,4,5] [5,5,5,5,5]  
[(1,5),(2,5),(3,5),(4,5),(5,5)]  
ghci> zip [1 .. 5] ["one", "two", "three", "four", "five"]  
[(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")] 
```

`zip` pairs up elements and produces a new list. The first element goes with the first, the second with the second, etc...

```
ghci> zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]  
[(5,"im"),(3,"a"),(2,"turtle")]  
```

Because Haskell is lazy, we can zip finite lists with infinite lists:

```
ghci> zip [1..] ["apple", "orange", "cherry", "mango"]  
[(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]  
```

## Types and Typeclasses
___

`::` is read as _"has type of"_. Explicit types are always denoted with the first letter in capital 

> If you want to give your function a type declaration but are unsure as to what it should be, just write the function without a type declaration and check it with :t. Functions are expressions too, so :t works on them without a problem.

**Int** stands for integer. It's used for whole numbers. 7 can be an Int but 7.2 cannot.

**Integer** stands for integer. The main difference is that it's not bounded so it can be used to represent really really big numbers.

```factorial :: Integer -> Integer  
factorial n = product [1..n]  
ghci> factorial 50  
30414093201713378043612608166064768844377641568960512000000000000 
```

**Float** is a real floating point with single precision.

```
circumference :: Float -> Float  
circumference r = 2 * pi * r  
ghci> circumference 4.0  
25.132742  
```

**Double** is a real floating point with double the precision!

```circumference' :: Double -> Double  
circumference' r = 2 * pi * r  
ghci> circumference' 4.0  
25.132741228718345 
```

**Bool** is a boolean type. It can have only two values: True and False.

**Char** represents a character. It's denoted by single quotes. A list of characters is a string.

### Type variables
___

Functions that have type variables are called **polymorphic functions**.

### Typeclasses 101
___

A typeclass is a sort of interface that defines some behavior.

`=>` is called a class constraint, read like this:

```
ghci> :t (==)  
(==) :: (Eq a) => a -> a -> Bool  
```
The equality function `(==)` takes any two values that are of the same type `a -> a` and returns a Bool `-> Bool`. The type of those two values must be a member of the Eq class (this was the class constraint) `(Eq a)`.

**Eq** `==`, `/=`
**Ord** `>`, `<`, `>=` and `<=`. To be _Ord_, a type must be a member of _Eq_.
**Show** Members of _Show_ can be presented as strings:

```
ghci> show 3  
"3"  
ghci> show 5.334  
"5.334"  
ghci> show True  
"True"  
```

**Read** the oposite of _Show_:

```
ghci> read "True" || False  
True  
ghci> read "8.2" + 3.8  
12.0  
ghci> read "5" - 2  
3  
ghci> read "[1,2,3,4]" ++ [3]  
[1,2,3,4,3]  
```

**type annotations** are a way of explicitly saying what the type of an expression should be. Done by adding `::` at the end of an expression and specifying a type:

```
ghci> read "5" :: Int  
5  
ghci> read "5" :: Float  
5.0  
ghci> (read "5" :: Float) * 4  
20.0  
ghci> read "[1,2,3,4]" :: [Int]  
[1,2,3,4]  
ghci> read "(3, 'a')" :: (Int, Char)  
(3, 'a')  
```

**Enum** are sequentially ordered types and they can be enumerated. They also have defined successors and predecesors, which you can be acessed using `succ` and `pred` functions.

**Bounded** have an upper and a lower bound:

```
ghci> minBound :: Int  
-2147483648  
ghci> maxBound :: Char  
'\1114111'  
ghci> maxBound :: Bool  
True  
ghci> minBound :: Bool  
False  
```

**Num** to be a _Num_, a type must already be  of _Show_ and _Eq_.
**Integral** _Num_ includes all numbers, including real numbers and integral numbers. _Integral_ includes only integral (whole) numbers. In this typeclass are `Int` and `Integer`.
**Floating** only floating point numbers, like _Float_ and _Double_

## Syntax in Functions
___

### Pattern matching
___

Pattern matching consists of specifying patterns to which some data should conform and then checking to see if it does and deconstructing the data according to those patterns. You can pattern match on any data type — numbers, characters, lists, tuples, etc.

_recursively_ defined in mathematics, the factorial of 0 is 1. Then the factorial of any positive integer is that integer multiplied by the factorial of its predecessor. Here's in Haskell terms:

```haskell
factorial :: (Integral a) => a -> a  
factorial 0 = 1  
factorial n = n * factorial (n - 1)  
```

_patterns_ handy way of breaking something up according to a pattern and binding it to names while keeping a reference to the pattern. You do that by putting a name and an `@` in front of a pattern `xs@(x:y:ys)`. This pattern will match exactly the same thing as `x:y:ys` but you can easily get the whole list via `xs` without repeating yourself:

```haskell
capital :: String -> String  
capital "" = "Empty string, whoops!"  
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
```

### Guards, guards!
___

_guards_ are a way of testing whether some property of a value (or several of them) are true or false. _Guards_ are a lot more readable when you have several conditions and they play really nicely with patterns.

_Guards_ are indicated by pipes `|` that follow a function's name and its parameters. A guard is basically a boolean expression. If it evaluates to `True`, then the corresponding function body is used. If it evaluates to `False`, checking drops through to the next guard and so on.  The last guard is `otherwise`. `otherwise` is defined simply as `otherwise = True` and catches everything.

### where!?
___

`where` The names we define in the where section of a function are only visible to that function, so we don't have to worry about them polluting the namespace of other functions.

```haskell
...
| bmi <= skinny = "You're underweight, you emo, you!"  
...
| otherwise     = "You're a whale, congratulations!"  
where bmi = weight / height ^ 2  
      skinny = 18.5  
      normal = 25.0  
      fat = 30.0  
```

You can also use where bindings to pattern match:

```haskell
...  
where bmi = weight / height ^ 2  
      (skinny, normal, fat) = (18.5, 25.0, 30.0)  
```

### let it be
___

**let** Very similar to where bindings, let bindings can be used for pattern matching. The form is let `<bindings>` in `<expression>`. The names that you define in the let part are accessible to the expression after the _in_ part.

```haskell
let boot x y z = x * y + z in boot 3 4 2
```

### Case expressions
___

The syntax for case expressions is pretty simple:

```haskell
case expression of pattern -> result  
                   pattern -> result  
                   pattern -> result  
                   ...  
```
`expression` is matched against the patterns.

```haskell
describeList :: [a] -> String  
describeList xs = "The list is " ++ what xs  
    where what [] = "empty."  
          what [x] = "a singleton list."  
          what xs = "a longer list." 
```

## Recursion

**Recursion** is a way of defining functions in which the function is applied inside its own definition. _Recursion_ is important to Haskell because unlike imperative languages, there are no while loops or for loops in Haskell and instead we many times have to use _recursion_ to declare what something is.

### Maximum awesome
___

The **maximum** function takes a list of things that can be ordered (instances of the Ord typeclass) and returns the biggest of them.

```haskell
maximum' :: (Ord a) => [a] -> a  
maximum' [] = error "maximum of empty list" -- if the list is empty, crash!
maximum' [x] = x -- if it's the singleton list, just give back the only element.
maximum' (x:xs)   
    | x > maxTail = x  
    | otherwise = maxTail  
    where maxTail = maximum' xs
```

or

```haskell
maximum' :: (Ord a) => [a] -> a  
maximum' [] = error "maximum of empty list"  
maximum' [x] = x  
maximum' (x:xs) = max x (maximum' xs) 
```

call maximum' on `[2,5,1]`. The first two patterns won't match. The third one will and the list is split into `2` and `[5,1]`. The _where_ clause wants to know the maximum of `[5, 1]`, so we follow that route. It matches the third pattern again and `[5, 1]` is split into `5` and `[1]`. Again, the where clause wants to know the maximum of `[1]`. Because that's the edge condition, it returns `1`. Finally! So going up one step, comparing `5` to the maximum of `[1]` (which is `1`), we obviously get back `5`. So now we know that the maximum of `[5, 1]` is `5`. We go up one step again where we had `2` and `[5, 1]`. Comparing `2` with the maximum of `[5, 1]`, which is `5`, we choose `5`.

### A few more recursive functions
___

`replicate` takes an `Int` and some element and returns a list that has several repetitions of the same element. `replicate 3 5` returns `[5,5,5]`. The edge condition is `0` or negative numbers. If we try to replicate something zero times, return an empty list.

```haskell
replicate' :: (Num i, Ord i) => i -> a -> [a]  
replicate' n x  
    | n <= 0    = []  
    | otherwise = x:replicate' (n-1) x 
```

### quick sort
___

```haskell
quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted  
```

### Thinking recursively
___

Usually you define an edge case and then you define a function that does something between some element and the function applied to the rest. It doesn't matter if it's a list, a tree or any other data structure. A sum is the first element of a list plus the sum of the rest of the list. A product of a list is the first element of the list times the product of the rest of the list. The length of a list is one plus the length of the tail of the list.

## Higher order functions
___

A function that can take functions as parameters and return functions as return values. A function that does either of those is called a **higher order function**.

Putting a space between two things is called **function application**. When parameters are separeted by a space it creates a function that takes one parameter and returns a function.

### Some higher-orderism is in order
___

### Map and filters
___

**map** takes a function and a list and applies that function to every element in the list, producing a new list.

**filter** is a function that takes a _predicate_ (a predicate is a function that tells whether something is true or not. A function that returns a boolean) and a list and then returns the list of elements that satisfy the _predicate_.

### Lambdas
___

**Lambdas** are anonymous functions that are used only once.

### Only folds and horses
___

A **fold** takes a binary function, a starting value (called the _accumulator_) and a list to fold up. The binary function itself takes two parameters. The binary function is called with the _accumulator_ and the first (or last) element and produces a new _accumulator_. Then, the binary function is called again with the new _accumulator_ and the now new first (or last) element, and so on. Once we've walked over the whole list, only the accumulator remains, which is what we've reduced the list to.

**foldl** the left fold's binary function has the accumulator as the first parameter and the current value as the second one `\acc x ->`

**foldr** the right fold's binary function has the current value as the first parameter and the accumulator as the second one `\x acc ->`

The **foldl1** and **foldr1** functions work much like _foldl_ and _foldr_, only you don't need to provide them with an explicit starting value. They assume the first (or last) element of the list to be the starting value and then start the fold with the element next to it.

### Function application with $
___

**$** _function application_ is right-associative. When a **$** is encountered, the expression on its right is applied as the parameter to the function on its left.

```haskell
sum (map sqrt [1..130])
sum $ map sqrt [1..130]
```

### function composition
___

Composing two functions that produces a new function that, when called with a parameter, `x` is the equivalent of calling `g` with the parameter `x` and then calling the `f` with that result.

**.** function composition, which is defined like so:

```haskell
(.) :: (b -> c) -> (a -> b) -> a -> c  
f . g = \x -> f (g x)  
```

is right-associative, so we can compose many functions at a time. The expression `f (g (z x))` is equivalent to `(f . g . z) x`.

```haskell
map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]  
[-14,-15,-27] 
```

to this:

```haskell
map (negate . sum . tail) [[1..5],[3..6],[1..7]]  
[-14,-15,-27] 
```

If you want to rewrite an expression with a lot of parentheses using function composition, start by putting the last parameter of the innermost function after a `$` and then just composing all the other function calls, writing them without their last parameter and putting dots between them. If you have `replicate 100 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8])))`, you can write it as `replicate 100 . product . map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8]`. If the expression ends with three parentheses, chances are that if you translate it into function composition, it'll have three composition operators.

## Modules

### Loading modules
___

Loading modules on the command line

`ghci> :m + Data.List `

To load up the names from several modules inside GHCI, we don't have to do `:m +` several times, we can just load up several modules at once.

`ghci> :m + Data.List Data.Map Data.Set`

To load only a couple of functions from a module, selectively import just those functions. To import the `nub` and `sort` functions from `Data.List`, Type:

```haskell
import Data.List (nub, sort)  
```

To import all of the functions of a module except a few:

```haskell
import Data.List hiding (nub)
```

**qualified imports** is one way of dealing with name clashes. The `Data.Map` module, which offers a data structure for looking up values by key, exports a bunch of functions with the same name as Prelude functions, like filter or null. So when we import `Data.Map` and then call filter, Haskell won't know which function to use. Here's how we solve this:

```haskell
import qualified Data.Map
```
This makes it so that if we want to reference Data.Map's filter function, we have to do `Data.Map.filter`, whereas just `filter` still refers to the normal `filter` we all know and love. But typing out Data.Map in front of every function from that module is kind of tedious. That's why we can rename the qualified import to something shorter:

```haskell
import qualified Data.Map as M
```
Now, to reference `Data.Map`'s do `M.filter`.

### Data.List
___

**intersperse**  
**intercalate** 
**transpose**
**concat**
**concatMap**  
**and**
**or** 
**any** and **all**
**iterate**  
**splitAt**
**takeWhile**
**dropWhile**  
**span**
**sort**  
**inits** and **tails**
**isPrefixOf** and **isSuffixOf**
**elem** and **notElem**
**partition**
**find**
**elemIndex**
**elemIndices**
**findIndex**
**lines**
**unlines**
**words** and **unwords**
**delete**  
**\\**
**union**  
**intersect**
**insert**


When names in a module clash with a lot of Prelude and other module names, we do a qualified import.

```
import qualified Data.Set as Set  
```

### Data.Char
___

All these predicates have a type signature of `Char -> Bool`. Used to filter out things like strings.

**isControl**
**isSpace**
**isLower**
**isUpper**
**isAlpha**
**isAlphaNum**
**isPrint**
**isDigit**
**isOctDigit**
**isHexDigit**
**isLetter**
**isMark**
**isNumber**
**isPunctuation**
**isSymbol**
**isSeparator**
**isAscii**
**isLatin1**
**isAsciiUpper**
**isAsciiLower**
**toUpper**
**toLower**
**toTitle**
**digitToInt**
**intToDigit**
**ord**

### Data.map
___

The **Data.Map** module offers association lists that are much faster (because they're internally implemented with trees) and also it provides a lot of utility functions.

**empty**
**insert**
**null**
**size**
**singleton**
**lookup**
**member**
**map**
**filter**
**toList**
**keys**
**elems**
**fromListWith**

### Data.set
___

Sets are a cross between _lists_ and _maps_. All the elements in a set are unique. And because they're internally implemented with trees (much like maps in **Data.Map**), they're ordered.

**fromList**
**intersection**
**difference**
**union**
**null**
**size**
**member**
**empty**
**singleton**
**insert**
**delete**
**map**
**filter**

#### Making our own modules
___

## Making Our Own Types and Typeclasses
___

> it's common to use the same name as the type if there's only one value constructor

`data` means that a new data type is defined. The `=` denotes the type (`Bool`). The parts after the `=` are **value constructors**. They specify the different values that this type can have. The `|` is read as _or_. We read this as: 

>the Bool type can have a value of True or False. Both the type name and the value constructors have to be capital cased.

### Record syntax
___

By using record syntax to create this data types creates functions that lookup fields in the data type.  Use record syntax when a constructor has several fields and it's not obvious which field is which.

### Type parameters
___

> **never add typeclass constraints in data declarations.**

A _type constructor_ is the part before the `=` and the _value constructor_ is right after it (possibly separated by `|`'s).

### Derived instances
___

### Type synonyms
___

**Type synonyms** they give some types different names so that they make more sense to someone reading our code and documentation.

### Recursive data structures
___

`4 `Cons` (5 `Cons` Empty)` is like `4:(5:[])`.

A _fixity_ declaration define functions as operators, and states how tightly the operator binds and whether it's left-associative or right-associative.


### Typeclasses 102
___

>typeclasses: are like interfaces. A typeclass defines some behavior (like comparing for equality, comparing for ordering, enumeration) and then types that can behave in that way are made instances of that typeclass.

### A yes-no typeclass
___

### The Functor typeclass
___

### Kinds and some type-foo
___

**kinds** labels assigned to types.

`*` means that the type is a _concrete type_. A _concrete type_ is a type that doesn't take any type parameters and values can only have types that are concrete types.

## Input and Output