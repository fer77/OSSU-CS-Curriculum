module Types where

-- 1. Type signature of general function
-- (++) :: [a] -> [a] -> [a]
-- myConcat :: [Char] -> [Char]

-- How might that change when applying the value
-- myConcat x = x ++ " yo"

-- 2. General function
-- (*) :: Num a => a -> a -> a; (*) = undefined
myMult :: Fractional a => a -> a

-- Applied to a value
myMult x = (x / 3) * 5