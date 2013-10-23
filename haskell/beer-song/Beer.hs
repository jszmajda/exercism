module Beer (verse, sing) where

import Data.Char (toUpper)

initialCaps :: String -> String
initialCaps []     = []
initialCaps (x:xs) = toUpper x : xs

verse :: Int -> String
verse n = firstPart ++ secondPart
  where
    firstPart  = unwords [initialCaps (sh n), bottle n, "of beer on the wall,", sh n, bottle n, "of beer.\n"]
    secondPart = unwords [whatToDo n, sh (n-1), bottle (n - 1), "of beer on the wall.\n"]
    whatToDo 0 = "Go to the store and buy some more,"
    whatToDo _ = unwords ["Take", one n, "down and pass it around,"]
    bottle 1   = "bottle"
    bottle _   = "bottles"
    one 1      = "it"
    one _      = "one"
    sh 0       = "no more"
    sh (-1)    = "99"
    sh x       = show x

sing :: Int -> Int -> String
sing from to = unlines $ map verse $ list from to
  where
    list from to
      | from > to = [from,(from - 1)..to]
      | otherwise = [from..to]
