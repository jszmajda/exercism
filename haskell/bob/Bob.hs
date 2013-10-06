module Bob (responseFor) where

import Data.Char

isShouting :: String -> Bool
isShouting m = hasAlpha && all isUpper alphaOnly
  where alphaOnly = filter isAlpha m
        hasAlpha  = not (null alphaOnly)

isQuestion :: String -> Bool
isQuestion m = last m == '?'

isSilence :: String -> Bool
isSilence m  = all isSpace m

responseFor :: String -> String
responseFor message
  | isSilence  message = "Fine. Be that way!"
  | isShouting message = "Woah, chill out!"
  | isQuestion message = "Sure."
  | otherwise          = "Whatever."
