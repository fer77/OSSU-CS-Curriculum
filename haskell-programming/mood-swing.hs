module MoodSwing where

changeMood :: Mood -> Mood
data Mood = Blah | Woot deriving Show
changeMood Blah = Woot
changeMood Woot = Blah