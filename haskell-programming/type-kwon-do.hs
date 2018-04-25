-- Type-Kwon-Do CH 5
1. h i = g (f i)
2. e A = w (q A)
3. xform (X, Y) = (xz X, yz Y)
4. munge xToY yToTupleWZ x = fst (yToTupleWZ (xToY x))

-- Type-Kwon-Do CH 6
1. 
chk :: Eq b => (a -> b) -> a -> b -> Bool 
chk f x y = f x == y

2. 
arith :: Num b => (a -> b) -> Integer -> a -> b
arith f x y = f y + fromIntegral x
