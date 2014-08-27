module LeapYear (isLeapYear) where

isLeapYear :: Int -> Bool
isLeapYear y = isDivByFour && (not isCentury || isFourHundred)
  where
    isDivByFour   = ym   4
    isCentury     = ym 100
    isFourHundred = ym 400
    ym = (== 0).mod y
