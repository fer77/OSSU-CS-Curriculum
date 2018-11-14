module Exercises where
    
import Data.List

-- Warm-up and review

stops = "pbtdkg"
vowels = "aeiou"

-- a)
stopsVowelsCombos :: [(Char, Char, Char)]
stopsVowelsCombos = [(s1, v, s2) | s1 <- stops, v <- vowels, s2 <- stops]

-- b)
startsWithP :: [(Char, Char, Char)]
startsWithP = [(s1, v, s2) | s1 <- stops, v <- vowels, s2 <- stops, s1 == 'p']

-- c)
nouns = ["Tina", "Louise", "Gene"]
verbs = ["groans at", "plots against", "farts at"]

belcherCombos :: [(String, String, String)]
belcherCombos = [(n1, v, n2) | n1 <- nouns, v <- verbs, n2 <- nouns]

-- Rewriting functions using folds
