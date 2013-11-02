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
    localCode = fst parts
    lastFour  = snd parts
    parts     = splitAt 3 $ drop 3 n
