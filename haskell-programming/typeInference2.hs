module TypeInference2 where

f x y = x + y + 3

--  with no type signature for f this still compiles. In some cases there might be a change, usually when using typeclasses in a way that doesn't make it clear unless asserting a type.