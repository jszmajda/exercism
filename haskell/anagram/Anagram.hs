module Anagram (anagramsFor) where

import Data.List (sort)
import Data.Char (toLower)

anagramsFor :: String -> [String] -> [String]
anagramsFor source = filter anagramOfSource
  where
    anagramOfSource w  = letters w == letters source && w /= source
    letters string     = sort $ map toLower string
