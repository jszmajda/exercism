module Scrabble (scoreLetter, scoreWord) where

import Data.Char (toLower)

scoreLetter :: Char -> Int
scoreLetter = scoreLetter' . toLower

scoreLetter' :: Char -> Int
scoreLetter' 'k' = 5
scoreLetter' l | l `elem` "qz"    = 10
               | l `elem` "jx"    = 8
               | l `elem` "fhvwy" = 4
               | l `elem` "bcmp"  = 3
               | l `elem` "dg"    = 2
               | otherwise        = 1

scoreWord :: String -> Int
scoreWord = sum . map scoreLetter
