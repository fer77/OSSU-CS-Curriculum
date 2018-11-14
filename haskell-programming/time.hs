import Data.Time
data DatabaseItem = DbString String
                  | DbNumber Integer
                  | DbDate   UTCTime
                  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem] 
theDatabase = 
    [ DbDate (UTCTime 
                (fromGregorian 1911 5 1)
        (secondsToDiffTime 34123)) , DbNumber 9001
    , DbString "Hello, world!"
    , DbDate (UTCTime
            (fromGregorian 1921 5 1)
            (secondsToDiffTime 34123))
    ]

-- 1.

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate = foldr getTimes []
  where
    getTimes :: DatabaseItem -> [UTCTime] -> [UTCTime]
    getTimes (DbDate time) dates = time:dates
    getTimes _ dates = dates

-- 2.

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber = foldr getNums []
  where
    getNums :: DatabaseItem -> [Integer] -> [Integer]
    getNums (DbNumber n) ns = n:ns
    getNums _ ns = ns

-- 3.

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = maximum . filterDbDate

-- 4.

sumDb :: [DatabaseItem] -> Integer
sumDb = sum . filterDbNumber

-- 5.

avgDb :: [DatabaseItem] -> Double
avgDb db = total / entries
  where total = (fromIntegral . sumDb) db
        entries = (fromIntegral . length . filterDbNumber) db