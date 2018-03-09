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