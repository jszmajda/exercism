module WordCount (wordCount) where

import Data.Char (isAlphaNum, toLower)
import Data.List.Split (wordsBy)
import Data.Map.Strict (Map, fromListWith)

wordCount :: String -> Map String Int
wordCount message = fromListWith (+) $ exploded wordCollection
  where
    exploded []     = []
    exploded (x:xs) = (x,1) : exploded xs
    wordCollection  = wordsBy (not . isAlphaNum) $ map toLower message
