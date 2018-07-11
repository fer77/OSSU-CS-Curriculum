-- 2.5

-- 1.
let half x = x / 2

-- 2.
let square x = x * x

-- 3.
let pie pi(x * x)

-- 2.7

-- 1.
let areax = 3.14 * (x * x)

-- 2.
let doublex = b * 2

-- 3.
let x = 7
    y = 10
    f = x + y

-- 2.10
-- Rewrite with where clauses:

-- 1.
-- let x = 3; y = 1000 in x * 3 + y
probNumOne = x * 3 + y
    where x = 3
          y = 1000

-- 2.
-- let y = 10; x = 10 * 5 + y in x * 5
probNumTwo = x * 5
    where y = 10
          x = 10 * 5 + y

-- 3.
-- let x = 7
--     y = negate x
--     z = y * 10
-- in z / x + y
probNumThree = z / x + y
    where x = 7
          y = negate x
          z = y * 10

-- 3.4 Scope
-- 1. yes
-- 2. no
-- 3. no
-- 4. yes

-- 3.5 concatenation
-- 1. no
-- [1, 2, 3] ++ [4, 5, 6]
-- >> [1,2,3,4,5,6]
-- 2. no
--  ?
-- 3. yes
-- concat ["<3", " Haskell"]
-- >> "<3 Haskell"

-- 3.8
-- 1. 
-- a. yes
-- concat [[1, 2, 3], [4, 5, 6]]
-- >> [1,2,3,4,5,6]
-- b. no
-- c. yes
-- d. sort of yes
-- e. no
-- f. yes
-- g. no
-- h. yes
-- 2.
-- a. (d)
-- b. (c)
-- c. (e)
-- d. (a)
-- e. (b)

-- 1.
-- a. 
-- Prelude> (++) "Curry is awesome" "!"
-- "Curry is awesome!"
-- b. 
-- Prelude> "Curry is awesome!" !! 4
-- 'y'
-- c. 
-- drop 9 "Curry is awesome!"
-- "awesome!"
-- 2., 3. & 4.
-- thirdLetter :: String
-- thirdLetter x = [x !! 3]
-- 5. 

-- 4.3
-- 1. bool.
-- 2. 'Blah' or 'Whoot'
-- 3. Mood is a boolean.
-- 4. 
-- 5. mood-swing.hs

-- 4.6
-- FIND THE MISTAKES
-- 1. not (True && True)
-- 2. not (x == 6)
-- 3. (1 * 2) >  5
-- 4. "Merry" > "Happy"
-- 5. "1, 2, 3 " ++ "look at me!"

-- 4.9
-- 1. length :: Foldable t => t a -> Int
-- 2. 
    -- a) 5
    -- b) 3
    -- c) 2
    -- d) 5
-- 3. the first passes, it is dividing intergers. The second fails because the '/' expects an interger and instead it receives an operation to get a list's length.
-- 4. div 6 (length [1, 2, 3])
-- 5. bool, true
-- 6. bool, false
-- 7.
    -- true
    --  error
    --  5
    --  false
    --  error
-- 8. palindrome.hs
-- 9. abs.hs
-- 10. 
-- f = (fst x, fst y) -> (snd x, snd y)
-- Syntax
-- syntax.hs
-- Match function names
-- 1. c
-- 2. b
-- 3. a
-- 4. d

-- 5.3
-- 1. 
    -- a) c
    -- b) d 
    -- c) b
    -- d) a
    -- e) e

-- 5.3
-- 1. a
-- 2. d ?
-- 3. d ?
-- 4. c ?
-- 5. a ?
-- 6. e ?
-- 7. d ?
-- 8. a ?
-- 9. c

-- 5.6
-- types-exercises.hs

-- 5.8 
-- 1. a
-- 2. a
-- 3. d
-- 4. c

-- 1. 
--  determine-the-type.hs
    -- a) 54 :: Num a => a
    -- b) (0, "dodge") :: Num t => (t, [Char])
    -- c) (0, "dodge") :: Num t => (Integer, [Char])
    -- d) False :: Bool
    -- e) 5 :: Int
    -- f) False :: Bool

-- 2. w :: Num a => a
-- 3. z y :: Num a => a
-- 4. f :: Fractional a => a
-- 5. f :: [Char]

-- 1. determine-the-type.hs
-- bigNum = (^) 5
-- wahoo = bigNum $ 10
-- 2. 
-- 3. 
-- a = (+)
-- b = 5
-- c = (a b 10)
-- d = (a c 200)
-- 4.
-- b = undefined
-- a = 12 + b
-- c = undefined
-- b = 10000 * c

-- 2. constrained polymorphic
-- 0 fully polymorphic type variable
-- 1 concrete type constructor
-- 2 concrete type constructor

-- 3. concrete type constructor
-- 0 concrete type constructor
-- 1 fully polymorphic type variable
-- 2 constrained polymorphic type variable
-- 3 concrete type constructor

-- 4. fully polymorphic
-- 0 constrained polymorphic
-- 1 fully polymorphic type variable
-- 3 concrete type constructor

-- 1. 
-- functionH :: [a] -> a
-- functionH (x:_) = x

-- 2. functionC :: Ord a => a -> a -> Bool
-- funtionC x y = 
--     if (x > y) then True else False

-- 3. functionS :: (a, b) -> a
-- functionS (x, y) = y

-- Type-Kwon-Do
-- 1. h i = g (f i)
-- 2. e A = w (q A)
-- 3. xform (X, Y) = (xz X, yz Y)
-- 4. munge xToY yToTupleWZ x = fst (yToTupleWZ (xToY x))

-- Eq Instances
-- 1. data TisAnInteger = 
--         TisAn Integer
    
--     instance Eq (TisAnInteger a) where
--         (==) (TisAn a) (TisAn a') = a == a'

-- 2. data TwoIntegers = 
--         Two Integer Integer

--     instance Eq (TwoIntegers a) where
--         (==) (Two a b) (Two a' b') = a == a' && b == b'

-- 3. data StringOrInt =
--         TisAnInt Int
--       | TisAString String

--     instance Eq StringOrInt where
--         (==) (TisAnInt a) = a == a'
--         (==) (TisAString a) = a == a'
--         (==) __ = False

-- 4. data Pair a =
--         Pair a a

--     instance Eq a => Eq (Pair a) where
--         (==) (Pair a a') (Pair b b') = a == b && a' == b'

-- 5. data Tuple a b =
--         Tuple a b

--     instance (Eq a, Eq b) => Eq (a, b) where
--         (==) (Tuple a a') (Tuple b b') = a == b && a' == b'

-- 6. data Which a =
--         ThisOne a
--       | ThisOne a

--     instance Eq a = Eq (Which a) where
--         (==) (ThisOne a) (ThisOne a') = a == a'
--         (==) (ThisOne a) (ThisOne a') = a == a'
--         (==) __ = False

-- 7. data EitherOr a b = 
--         Hello a
--       | Goodbye b

--     instance (Eq a, Eq b) = Eq (EitherOr a b) where
--         (==) (Hello a) (Hello a') = a == a'
--         (==) (Goodbye a) (Goodbye a') = a == a'
--         (==) __ = False

-- 6.14
-- 1. c
-- 2. a
-- 3. a
-- 4. d
-- 5. b

-- Does it typecheck?
-- 1. fixed by having typeclass Person derive Show
-- data Person = Person Bool deriving Show

-- printPerson :: Person -> IO ()
-- printPerson person = putStrLn (show person)

-- 2. woot needed to implement Eq
-- data Mood = Blah | Woot deriving (Show, Eq)

-- settleDown :: Mood -> Mood
-- settleDown x = if x == Woot
--                  then Blah
--                  else x

-- 3.
-- a) What are acceptable inputs to settleDown?
--  Blah or Woot. members of the Mood typeclass
-- b) What will happen if you try to run settleDown 9?
--  It will be a type error because the Mood typeclass doesn't implement an instance of Num
-- c) What will happen if you try to run Blah > Woot
--  It will be a type error because Mood doesn't implememt an Ord instance and methods.

-- Given a datatype declaration, what can we do?
-- 1. Doesn't type check because Papu expects an instance of Rocks and Yeah not
--    String and Bool
-- 2. Works
-- 3. ?
-- 4. ?

-- Match the type

-- 7.3 Grab bag
-- 1. all are equivalent
-- 2. mTh 3 :: Num a => a -> a -> a
-- 3.
    -- a.
    --  //..
    -- where f = \n -> n + 1
    -- b. 
    -- addFive = \x -> \y -> (if x > y then y else x) + 5
    -- c.
    -- mflip f x y = f y x

-- 7.4
-- Variety Pack
-- 1. 
    -- a. k :: (a, b) -> b
    -- b. k2 :: Num b => b, it is the same as k1, but not k3
    -- c. k3.
-- 2. 
-- f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
-- f (a, b, c) (d, e, f) = ((a, d), (c, f)) ??

-- 7.5
-- Case Practice
-- 1. function x y = if (x > y) then x else y
-- function x y =
--     case (x > y) of
--         True -> x
--         False -> y
-- 2. ifEvenAdd2 n = if even n then (n+2) else n
-- ifEvenAdd2 n =
--     case isEven of
--         True -> (n + 2)
--         False -> n
--     where isEven = (even n)
-- 3. nums x = 
--     case compare x 0 of
--         LT -> -1
--         GT -> 1
--         EQ -> 0

-- 7.5
-- artful dodgy

-- 7.7
-- 3. a, b
-- 4. strings
-- 5. String -> String
-- 6. c
-- 7. numbers
-- 8. Integer -> Integer

-- 7.11
-- 1. b
-- 2. d
-- 3. d
-- 4. a
-- 5. d

-- Let's write code
-- 1. 
    -- a.
    -- b. I guess
    -- divMod :: Integral a => a -> a -> (a, a)
    -- tensDigit :: Integral a => a -> a
    -- c. 

-- 8.6
-- 1. d
-- 2. b
-- 3. d
-- 4. b

-- Reviewing currying
