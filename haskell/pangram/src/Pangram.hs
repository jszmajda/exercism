module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = all inText ['a'..'z']
  where
    inText c = c `elem` lower
    lower = map toLower text
