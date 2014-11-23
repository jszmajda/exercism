module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar (Day, fromGregorian, gregorianMonthLength)
import Data.Time.Format
import System.Locale
import Data.Maybe (fromJust)
import Data.List (elemIndex, elemIndices)
import Data.Ix

data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Show, Eq, Read, Enum, Ix, Ord)

data Schedule = First | Second | Third | Fourth | Last | Teenth
  deriving (Show, Eq, Enum)

teenths :: [Int]
teenths = [13,14,15,16,17,18,19]

type Month = Int
type Year  = Integer

meetupDay :: Schedule -> Weekday -> Year -> Month -> Day
meetupDay s w y m = fromGregorian y m d
  where
    md = monthDays y m
    d  = case s of
           Teenth -> teenthDay w md
           Last   -> lastMeetupDay w y m
           _      -> meetupDay' s w md

teenthDay :: Weekday -> [(Int, Weekday)] -> Int
teenthDay w md = fst $ findSndTuple w td
  where
    td = filter teenth md
    teenth d = fst d `elem` teenths

lastMeetupDay :: Weekday -> Year -> Month -> Int
lastMeetupDay w y m = fst $ findSndTuple w md'
  where
    md = monthDays y m
    md' = reverse $ take (gregorianMonthLength y m) md

meetupDay' :: Schedule -> Weekday -> [(Int, Weekday)] -> Int
meetupDay' s w md = 1 + nthElemIndex w nth md
  where nth = fromEnum s

monthDays :: Year -> Month -> [(Int,Weekday)]
monthDays y m = zip [1,2..] days
  where days = cycle $ weekFromString firstDay
        firstDay = dayName $ fromGregorian y m 1

dayName :: Day -> String
dayName = formatTime defaultTimeLocale "%A"

weekFromString :: String -> [Weekday]
weekFromString d = offsetWeek $ fromEnum day
  where
    day          = read d :: Weekday
    offsetWeek o = take 7 $ drop o $ cycle allDays

allDays :: [Weekday]
allDays = range (Monday, Sunday)

elemIndex' :: Eq a => a -> [a] -> Int
elemIndex' e l = fromJust $ elemIndex e l

findSndTuple :: Eq b => b -> [(a,b)] -> (a,b)
findSndTuple e l = l !! idx
  where idx = elemIndex' e l'
        l'  = map snd l

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
