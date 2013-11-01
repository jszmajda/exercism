module Phone (areaCode, number, prettyPrint) where

import Data.Char

number :: String -> String
number n | valid     = lastTen
         | otherwise = "0000000000"
  where
    valid   = length digits == 10 || (length digits == 11 && head digits == '1')
    lastTen = reverse $ take 10 $ reverse digits
    digits  = filter isNumber n

areaCode :: String -> String
areaCode = take 3

prettyPrint :: String -> String
prettyPrint s = "(" ++ (areaCode n) ++ ") " ++ localCode ++ "-" ++ lastFour
  where
    n         = number s
    localCode = slice 3 5
    lastFour  = slice 6 9
    slice f t = take (t - f + 1) (drop f n)
