module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar (Day, fromGregorian)
import Data.Time.Format
import System.Locale
import Data.Maybe (fromJust)
import Data.List (elemIndex, elemIndices)

data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Show, Eq, Read, Enum)

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
    d  = if s == Teenth then teenthDay w md else meetupDay' s w md

meetupDay' :: Schedule -> Weekday -> [(Int, Weekday)] -> Int
meetupDay' Last   w md = fst (reverse md !! tupleIndex w (reverse md))
meetupDay' s w md = 1 + nthElemIndex w nth md
  where nth = fromEnum s

teenthDay :: Weekday -> [(Int, Weekday)] -> Int
teenthDay w md = fst $ td !! tupleIndex w td
  where
    td = filter teenth md
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
weekFromString d = offsetWeek $ fromEnum day
  where
    day = read d :: Weekday


allDays :: [Weekday]
allDays = [Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday]

daysInMonth :: Year -> Month -> Int
daysInMonth y m = if m == 2 then february else case m of
                  4  -> 30
                  6  -> 30
                  9  -> 30
                  11 -> 30
                  _  -> 31
  where february = if isLeapYear y then 29 else 28

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
