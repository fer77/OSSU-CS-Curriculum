## 2.5

1.
```haskell
let half x = x / 2
```
2.
```haskell
let square x = x * x
```
3.
```haskell
let pie pi(x * x)
```
## 2.7

1.
```haskell
let areax = 3.14 * (x * x)
```
2.
```haskell
let doublex = b * 2
```
3.
```haskell
let x = 7
    y = 10
    f = x + y
```
## 2.10

### Rewrite with where clauses:

1.
```haskell
let x = 3; y = 1000 in x * 3 + y
probNumOne = x * 3 + y
    where x = 3
          y = 1000
```
2.
```haskell
let y = 10; x = 10 * 5 + y in x * 5
probNumTwo = x * 5
    where y = 10
          x = 10 * 5 + y
```
3.
```haskell
let x = 7
    y = negate x
    z = y * 10
in z / x + y
probNumThree = z / x + y
    where x = 7
          y = negate x
          z = y * 10
```
## 3.4 Scope
1. yes
2. no
3. no
4. yes

## 3.5 concatenation
1. no
```
[1, 2, 3] ++ [4, 5, 6]
>> [1,2,3,4,5,6]
```
2. no
```
 ?
```
3. yes
```
concat ["<3", " Haskell"]
>> "<3 Haskell"
```

## 3.8
1. 
    a. yes
```
    concat [[1, 2, 3], [4, 5, 6]]
    >> [1,2,3,4,5,6]
```
    b. no
    c. yes
    d. sort of yes
    e. no
    f. yes
    g. no
    h. yes
2.
    a. (d)
    b. (c)
    c. (e)
    d. (a)
    e. (b)

1.
    a. 
```
    Prelude> (++) "Curry is awesome" "!"
    "Curry is awesome!"
```
    b. 
```
    Prelude> "Curry is awesome!" !! 4
    'y'
```
    c. 
```
    drop 9 "Curry is awesome!"
    "awesome!"
```
2., 3. & 4.
```
thirdLetter :: String
thirdLetter x = [x !! 3]
```
5. 

## 4.3
1. bool.
2. 'Blah' or 'Whoot'
3. Mood is a boolean.
4. 
5. mood-swing.hs

## 4.6
FIND THE MISTAKES
---
1. not (True && True)
2. not (x == 6)
3. (1 * 2) >  5
4. "Merry" > "Happy"
5. "1, 2, 3 " ++ "look at me!"

## 4.9
1. length :: Foldable t => t a -> Int
2. 
    a) 5
    b) 3
    c) 2
    d) 5
3. the first passes, it is dividing intergers. The second fails because the '/' expects an interger and instead it receives an operation to get a list's length.
4. div 6 (length [1, 2, 3])
5. bool, true
6. bool, false
7.
    true
     error
     5
     false
     error
8. palindrome.hs
9. abs.hs
10. 
f = (fst x, fst y) -> (snd x, snd y)
Syntax
syntax.hs
Match function names
1. c
2. b
3. a
4. d

## 5.3
1. 
    a) c
    b) d 
    c) b
    d) a
    e) e

## 5.3
1. a
2. d ?
3. d ?
4. c ?
5. a ?
6. e ?
7. d ?
8. a ?
9. c

## 5.6
### types-exercises.hs
___

## 5.8 
1. a
2. a
3. d
4. c

 
 ### determine-the-type.hs
 ___

 1.
    a)
```haskell 
    54 :: Num a => a
```
    b)
```haskell 
    (0, "dodge") :: Num t => (t, [Char])
```
    c)
```haskell 
    (0, "dodge") :: Num t => (Integer, [Char])
```
    d)
```haskell 
    False :: Bool
```
    e)
```haskell 
    5 :: Int
```
    f)
```haskell 
    False :: Bool
```

2.
```haskell
 w :: Num a => a
```
3.
```haskell
 z y :: Num a => a
```
4.
```haskell
 f :: Fractional a => a
```
5.
```haskell
 f :: [Char]
```

1. 
> determine-the-type.hs

> bigNum = (^) 5

> wahoo = bigNum $ 10
2. 
3. 
> a = (+)

> b = 5

> c = (a b 10)

> d = (a c 200)
4.
> b = undefined

> a = 12 + b

> c = undefined

> b = 10000 * c

2. 
> constrained polymorphic
> 0 fully polymorphic type variable
> 1 concrete type constructor
> 2 concrete type constructor

3. 
> concrete type constructor
> 0 concrete type constructor
> 1 fully polymorphic type variable
> 2 constrained polymorphic type variable
> 3 concrete type constructor

4. 
> fully polymorphic
> 0 constrained polymorphic
> 1 fully polymorphic type variable
> 3 concrete type constructor

1. 
```haskell
functionH :: [a] -> a
functionH (x:_) = x
```
2. 
```haskell
functionC :: Ord a => a -> a -> Bool
funtionC x y = 
    if (x > y) then True else False
```
3.
```haskell 
functionS :: (a, b) -> a
functionS (x, y) = y
```

### Type-Kwon-Do
___

1. h i = g (f i)
2. e A = w (q A)
3. xform (X, Y) = (xz X, yz Y)
4. munge xToY yToTupleWZ x = fst (yToTupleWZ (xToY x))

### Eq Instances
___

1.
```haskell
 data TisAnInteger = 
        TisAn Integer
    
    instance Eq (TisAnInteger a) where
        (==) (TisAn a) (TisAn a') = a == a'
```
2.
```haskell
 data TwoIntegers = 
        Two Integer Integer

    instance Eq (TwoIntegers a) where
        (==) (Two a b) (Two a' b') = a == a' && b == b'
```
3.
```haskell
 data StringOrInt =
        TisAnInt Int
      | TisAString String

    instance Eq StringOrInt where
        (==) (TisAnInt a) = a == a'
        (==) (TisAString a) = a == a'
        (==) __ = False
```
4.
```haskell
 data Pair a =
        Pair a a

    instance Eq a => Eq (Pair a) where
        (==) (Pair a a') (Pair b b') = a == b && a' == b'
```
5.
```haskell
 data Tuple a b =
        Tuple a b

    instance (Eq a, Eq b) => Eq (a, b) where
        (==) (Tuple a a') (Tuple b b') = a == b && a' == b'
```
6.
```haskell
 data Which a =
        ThisOne a
      | ThisOne a

    instance Eq a = Eq (Which a) where
        (==) (ThisOne a) (ThisOne a') = a == a'
        (==) (ThisOne a) (ThisOne a') = a == a'
        (==) __ = False
```
7.
```haskell
 data EitherOr a b = 
        Hello a
      | Goodbye b

    instance (Eq a, Eq b) = Eq (EitherOr a b) where
        (==) (Hello a) (Hello a') = a == a'
        (==) (Goodbye a) (Goodbye a') = a == a'
        (==) __ = False
```

## 6.14
1. c
2. a
3. a
4. d
5. b

### Does it typecheck?
___

1. fixed by having typeclass Person derive Show
```haskell
data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)
```
2. woot needed to implement Eq
```haskell
data Mood = Blah | Woot deriving (Show, Eq)

settleDown :: Mood -> Mood
settleDown x = if x == Woot
                 then Blah
                 else x
```
3.
a) What are acceptable inputs to settleDown?
 > Blah or Woot. members of the Mood typeclass

b) What will happen if you try to run settleDown 9?
 >It will be a type error because the Mood typeclass doesn't implement an instance of Num

c) What will happen if you try to run Blah > Woot
 >It will be a type error because Mood doesn't implememt an Ord instance and methods.

Given a datatype declaration, what can we do?
1. Doesn't type check because Papu expects an instance of `Rocks` and `Yeah` not `String and Bool`
2. Works
3. ?
4. ?

### Match the type
___

## 7.3 Grab bag
1. all are equivalent
2. mTh 3 :: Num a => a -> a -> a
3.
    a.
```haskell
     //..
    where f = \n -> n + 1
```
    b. 
```haskell
    addFive = \x -> \y -> (if x > y then y else x) + 5
```
    c.
```haskell
    mflip f x y = f y x
```

## 7.4
### Variety Pack
___
1. 
```haskell
    a. k :: (a, b) -> b
    b. k2 :: Num b => b, it is the same as k1, but not k3
    c. k3.
```
2. 
```haskell
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d), (c, f)) ??
```

## 7.5
### Case Practice
___

1.
```haskell 
function x y = if (x > y) then x else y
function x y =
    case (x > y) of
        True -> x
        False -> y
```
2.
```haskell 
ifEvenAdd2 n = if even n then (n+2) else n
ifEvenAdd2 n =
    case isEven of
        True -> (n + 2)
        False -> n
    where isEven = (even n)
```
3.
```haskell 
nums x = 
    case compare x 0 of
        LT -> -1
        GT -> 1
        EQ -> 0
```

## 7.5
### artful dodgy
___

## 7.7
3. a, b
4. strings
5. String -> String
6. c
7. numbers
8. Integer -> Integer

## 7.11
1. b
2. d
3. d
4. a
5. d

### Let's write code
___

1. 
    a.

    b. I guess
```haskell
    divMod :: Integral a => a -> a -> (a, a)
    tensDigit :: Integral a => a -> a
```
    c. 

## 8.6
1. d
2. b
3. d
4. b

### Reviewing currying
___
```haskell
cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y
-- fill in the types
flippy :: String -> String -> String
flippy = flip cattyConny 

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"
```

1. `"woops mrow woohoo!"`
2. `"1 mrow haha"`
3. `"woops mrow 2 mrow haha"`
4. `"woops mrow blue mrow haha"`
5. `"pink mrow haha mrow green mrow woops mrow blue"`

### recursion
___

1.
```haskell
dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
  where go n d count
          | n < d = (count, n)
          | otherwise = go (n - d) d (count + 1)
```

2.
```haskell
sumN :: (Eq a, Num a) => a -> a
sumN 0 = 0
sumN n = n + sumN (n - 1)
```

3.
```haskell
multipliedBy :: Integral a => a -> a -> a
multipliedBy x y = go x 0 0
  where go x' s count
          | count == y = s
          | otherwise = go x' (s + x') (count + 1)
```

### Fixing dividedBy
___

```haskell
data DividedResult
    = Result (Integer, Integer)
    | DividedByZero
    deriving Show
  
  dividedBy :: Integer -> Integer -> DividedResult
  dividedBy 0 _ = Result (0, 0)
  dividedBy _ 0 = DividedByZero
  dividedBy num denom = go absNum absDenom 0
    where multiplier = signum num * signum denom
          absNum = abs num
          absDenom = abs denom
          go n d count
            | n < d = Result (count * multiplier, n)
            | otherwise = go (n - d) d (count + 1)
```

### McCarthy 91 function
---
```haskell
mc91 :: (Integral a) => a -> a
mc91 n
  | n > 100 = n - 10
  | otherwise = mc91 (mc91 (n + 11))
```

### Numbers into words
___

```haskell
module WordNumber where
import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord n = undefined

digits :: Int -> [Int]
digits n = undefine
wordNumber :: Int -> String
wordNumber n = undefined
```

## 9
### Thy Fearful Symmetry
___

1.
```haskell
myWords' :: String -> [String]
myWords' [] = []
myWords' (' ':xs) = myWords xs
myWords' xs = takeWhile (/= ' ') xs : myWords (dropWhile (/= ' ') xs)
```

2.
```haskell
module PoemLines where

sentences :: String
sentences = "Tyger Tyger, burning bright\n" ++
            "In the forests of the night\n" ++
            "What immortal hand or eye\n" ++
            "Could frame thy fearful symmetry?"

myLines :: String -> [String]
myLines "" = []
myLines script = line : myLines remaining
  where line = takeWhile (/='\n') script
        lineLength = length line
        remaining = drop (lineLength + 1) script

shouldEqual :: [String]
shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?"
  ]

main :: IO ()
main =
  print $ "Are they equal? " ++ show (myLines sentences == shouldEqual)
```
3.
```haskell
explodeStrOnChar :: Char -> String -> [String]
explodeStrOnChar _ "" = []
explodeStrOnChar char str = subString : explodeStrOnChar char remainingStr
  where subString = takeWhile (/= char) str
        remainingStr = drop (length subString + 1) str
```

### Square Cube
___

1. 
```haskell
[(x, y) | x <- mySqr,
          y <- mySqr]
```
2.
```haskell
[(x, y) | x <- mySqr,
          y <- mySqr,
          x < 50, y < 50]
```
3.
```haskell
length [(x, y) | x <- mySqr,
                 y <- mySqr,
                 x < 50, y > 50]
```

## Bottom Madness 
### Will it blow up?

1. `[x^y | x <- [1..5], y <- [2, undefined]]`, explodes
2.  `take 1 $
    [x^y | x <- [1..5], y <- [2, undefined]]`, returns `[1]`
3. `sum [1, undefined, 3]`, explodes
4. `length [1, 2, undefined]`, no returns the length of the list `3`
5. `length $ [1, 2, 3] ++ undefined`, explodes
6. `take 1 $ filter even [1, 2, 3, undefined]`, returns `[2]`
7. `take 1 $ filter even [1, 3, undefined]`, explodes
8. `take 1 $ filter odd [1, 3, undefined]`, returns `[1]`
9. `take 2 $ filter odd [1, 3, undefined]`, returns `[1, 3]`
10. `take 3 $ filter odd [1, 3, undefined]`, explodes

### Intermission: Is it in normal form?

For each expression below, determine whether it's in:
1. normal form, which implies weak head normal form;
2. weak head normal form only; or,
3. neither.

1. `[1, 2, 3, 4, 5]`
> NF
2. `1 : 2 : 3 : 4 : _`
> WHNF
3. `enumFromTo 1 10`
> ?
4. `length [1, 2, 3, 4, 5]`
> ?
5. `sum (enumFromTo 1 10)`
> ?
6. `['a'..'m'] ++ ['n'..'z']`
> ?
7. `(_, 'b')`
> WHF

## More Bottoms

1. Will the following expression return a value or be `⊥`? 
`take 1 $ map (+1) [undefined, 2, 3]`, `⊥`
2. Will the following expression return a value?
`take 1 $ map (+1) [1, undefined, 3]`, `[2]`
3. Will the following expression return a value?
`take 2 $ map (+1) [1, undefined, 3]`, `⊥`
4. What does the following mystery function do? What is its type? Describe it (to yourself or a loved one) in standard English and then test it out in the REPL to make sure you were correct.

```
itIsMystery xs =
map (\x -> elem x "aeiou") xs
```

> takes a string and returns true for vowels and false for everything else.

5. What will be the result of the following functions:

a) `map (^2) [1..10]`, `[1,4,9,16,25,36,49,64,81,100]`

b) 
```
map minimum [[1..10], [10..20], [20..30]] 
-- n.b. `minimum` is not the same function 
-- as the `min` that we used before
```

`[1,10,20]`

c) `map sum [[1..5], [1..5], [1..5]]`, `[15,15,15]`

6. Back in chapter 7, you wrote a function called `foldBool`. That function exists in a module known as `Data.Bool` and is called `bool`. Write a function that does the same (or similar, if you wish) as the map (if-then-else) function you saw above but uses bool instead of the if-then-else syntax. Your first step should be bringing the `bool` function into scope by typing import `Data.Bool` at your Prelude prompt.

```
map (\x -> bool x (-x) (x == 3)) [1..10]
```

## Filtering

1. Given the above, how might we write a filter function that would give us all the multiples of 3 out of a list from 1-30?

```
filter (\x -> (rem x 3) == 0) [1..30]
```

2. Recalling what we learned about function composition, how could we compose the above function with the length function to tell us _how many_ multiples of 3 there are between 1 and 30?

```
length (filter (\x -> rem x 3 == 0) [1..30])
```

3. Next we're going to work on removing all articles ('the', 'a', and 'an') from sentences. You want to get to something that works like this:

```
Prelude> myFilter "the brown dog was a goof"
["brown","dog","was","goof"]
```

You may recall that earlier in this chapter we asked you to write a function that separates a string into a list of strings by separating them at spaces. That is a standard library function called words. You may consider starting this exercise by using words (or your version, of course).

```
```

## Zipping

1. Write your own version of zip and ensure it behaves the same as the original.

```
zip :: [a] -> [b] -> [(a, b)]
zip = undefined
```

```
zippy [] = []
zippy [] _ = []
zippy _ [] = []
zippy (x:xs) (y:ys) = (x, y) : zippy xs ys
```

2. Do what you did for zip, but now for zipWith:

```
zipWith :: (a -> b -> c)
        -> [a] -> [b] -> [c]
zipWith = undefined
```

```
zippyWith _ [] _ = []
zippyWith _ _ [] = []
zippyWith f (x:xs) (y:ys) = f x y : zippypWith f xs ys
```

3. Rewrite your zip in terms of the zipWith you wrote.

```
zippy = zippyWith (\x y -> (x, y))
```