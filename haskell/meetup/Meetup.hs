module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar (Day, fromGregorian)
import Data.Time.Format
import System.Locale
import Data.Maybe (fromJust)
import Data.List (elemIndex, elemIndices)

data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Show, Eq)

data Schedule = Teenth | First | Second | Third | Fourth | Last
  deriving Show

teenths :: [Int]
teenths = [13,14,15,16,17,18,19]

type Month = Int
type Year  = Integer

daysInMonth :: Year -> Month -> Int
daysInMonth y m = if m == 2 then february else case m of
                  4  -> 30
                  6  -> 30
                  9  -> 30
                  11 -> 30
                  _  -> 31
  where february = if isLeapYear y then 29 else 28

meetupDay :: Schedule -> Weekday -> Year -> Month -> Day
meetupDay First  w y m = fromGregorian y m $ (+) 1 $ nthElemIndex w 0 md
  where md = monthDays y m
meetupDay Second w y m = fromGregorian y m $ (+) 1 $ nthElemIndex w 1 md
  where md = monthDays y m
meetupDay Third  w y m = fromGregorian y m $ (+) 1 $ nthElemIndex w 2 md
  where md = monthDays y m
meetupDay Fourth w y m = fromGregorian y m $ (+) 1 $ nthElemIndex w 3 md
  where md = monthDays y m
meetupDay Last   w y m = fromGregorian y m $ fst (reverse md !! tupleIndex w (reverse md))
  where md = monthDays y m
meetupDay Teenth w y m = fromGregorian y m $ fst $ td !! tupleIndex w td
  where
    td = filter teenth (monthDays y m)
    teenth d = fst d `elem` teenths

monthDays :: Year -> Month -> [(Int,Weekday)]
monthDays y m = zip [1,2..] days
  where days = take (daysInMonth y m) $ cycle $ weekFromString firstDay
        firstDay = dayName $ fromGregorian y m 1

offsetWeek :: Int -> [Weekday]
offsetWeek o = take 7 $ drop o $ cycle allDays

dayName :: Day -> String
dayName = formatTime defaultTimeLocale "%A"

weekFromString :: String -> [Weekday]
weekFromString d = offsetWeek $ case d of
                        "Monday"    -> 0
                        "Tuesday"   -> 1
                        "Wednesday" -> 2
                        "Thursday"  -> 3
                        "Friday"    -> 4
                        "Saturday"  -> 5
                        _           -> 6

allDays :: [Weekday]
allDays = [Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday]

-- validDays First Monday =
-- maybe go down this road?
  -- import Data.Time.Format
  -- import System.Locale
  -- import Data.Time.Clock
  -- a <- getCurrentTime
  -- formatTime defaultTimeLocale "%A" a
  --
elemIndex' :: Eq a => a -> [a] -> Int
elemIndex' e l = fromJust $ elemIndex e l

tupleIndex :: Eq a => a -> [(b,a)] -> Int
tupleIndex e l = elemIndex' e l'
  where l' = map snd l

nthElemIndex :: Eq a => a -> Int -> [(b,a)] -> Int
nthElemIndex e offset l = elemIndices e l' !! offset
  where l' = map snd l

isLeapYear :: Year -> Bool
isLeapYear y = isDivByFour && (not isCentury || isFourHundred)
  where
    isDivByFour   = ym   4
    isCentury     = ym 100
    isFourHundred = ym 400
    ym = (== 0) . mod y
