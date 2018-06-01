-- tensDigit :: Integral a => a -> a 
-- tensDigit x = d
--     where xLast = x `div` 10
--           d = xLast `mod` 10

foldBool :: a -> a -> Bool -> a 
foldBool = x y condition =
  case condition of
    True -> x
    False -> y

foldBool1 :: a -> a -> Bool -> a 
foldBool1 = x y condition
    | condition = x
    | otherwise = y