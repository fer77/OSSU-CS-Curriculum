module Rvrs where

rvrs :: String -> String
rvrs s = concat [e, " ", m, " ", b]
  where b = take 5 s
        m = take 2 $ drop 6 s
        e = drop 9 s

main :: IO()
main = print()