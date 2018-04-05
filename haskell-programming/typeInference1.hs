module TypeInference1 where

f :: Num a => a -> a -> a

f x y = x + y + 3

-- Prelude> :l typeInference1.hs
-- [1 of 1] Compiling TypeInference1   ( typeInference1.hs, interpreted )
-- Ok, one module loaded.
-- *TypeInference1> f 1 2
-- 6
-- *TypeInference1> :t f
-- f :: Num a => a -> a -> a
-- *TypeInference1> :t f 1
-- f 1 :: Num a => a -> a
-- *TypeInference1>
-- cant get a more specific type when applying f to 1, because of numeric literals in Haskell are a polymorphic type Num a => a.