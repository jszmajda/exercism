module LeapYear (isLeapYear) where

isLeapYear :: Int -> Bool
isLeapYear y = isDivByFour && (not isCentury || isFourHundred)
  where
    isDivByFour   = ym   4 == 0
    isCentury     = ym 100 == 0
    isFourHundred = ym 400 == 0
    ym = mod y
