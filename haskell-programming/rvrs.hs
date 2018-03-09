module Rvrs where

rvrs :: String -> String
rvrs s = concat [third, " ", second, " ", first]
  where first = take 5 s
        second = take 2 $ drop 6 s
        third = drop 9 s
