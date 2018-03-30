module Types where

-- 1. Type signature of general function
-- (++) :: [a] -> [a] -> [a]
-- myConcat :: [Char] -> [Char]

-- How might that change when applying the value
-- myConcat x = x ++ " yo"

-- 2. General function
-- (*) :: Num a => a -> a -> a; (*) = undefined
-- myMult :: Fractional a => a -> a

-- Applied to a value
-- myMult x = (x / 3) * 5

-- 3. 
-- take :: Int -> [a] -> [a]
-- myTake :: Int -> [Char]
-- myTake x = take x "hey you"

-- 4. 
-- (>) :: Ord a => a -> a -> Bool
-- myCom :: Int -> Bool
-- myCom x = x > (length [1..10])

-- 5. 
-- (<) :: Ord a => a -> a -> Bool
-- myAlph :: Char -> Bool
-- myAlph x = x < 'z'