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

###where!?
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