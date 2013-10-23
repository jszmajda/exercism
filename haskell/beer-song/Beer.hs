module Beer where

import Data.Char (toUpper)

verse :: Int -> String
verse n = firstPart ++ secondPart
  where
    firstPart  = initialCaps s ++ " " ++ bottle n ++ " of beer on the wall, " ++ s ++ " " ++ bottle n ++ " of beer.\n"
    secondPart = whatToDo n ++ ", " ++ sh (n-1) ++ " " ++ bottle (n - 1) ++ " of beer on the wall.\n"
    whatToDo 0 = "Go to the store and buy some more"
    whatToDo _ = "Take " ++ one n ++ " down and pass it around"
    initialCaps (x:xs) = toUpper x : xs
    bottle 1 = "bottle"
    bottle _ = "bottles"
    one 1 = "it"
    one _ = "one"
    s = sh n
    sh 0 = "no more"
    sh (-1) = "99"
    sh x = show x

sing :: Int -> Int -> String
sing from to = unlines $ map verse $ list from to
  where
    list from to
      | from > to = [from,(from - 1)..to]
      | otherwise = [from..to]
