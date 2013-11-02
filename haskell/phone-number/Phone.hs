module Phone (areaCode, number, prettyPrint) where

import Data.Char

number :: String -> String
number n | valid     = lastTen
         | otherwise = "0000000000"
  where
    valid   = len == 10 || (len == 11 && head digits == '1')
    lastTen = drop extra digits
    digits  = filter isNumber n
    len     = length digits
    extra   = len - 10

areaCode :: String -> String
areaCode = take 3

prettyPrint :: String -> String
prettyPrint s = "(" ++ (areaCode n) ++ ") " ++ localCode ++ "-" ++ lastFour
  where
    n         = number s
    localCode = slice 3 5
    lastFour  = drop 6 n
    slice f t = take (t - f + 1) (drop f n)
