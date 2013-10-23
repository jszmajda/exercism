module WordCount (wordCount) where

import Data.Char (isAlphaNum, toLower)
import Data.List.Split (wordsBy)
import Data.Map.Strict (Map, fromListWith)

wordCount :: String -> Map String Int
wordCount message = fromListWith (+) $ exploded words
  where
    exploded = (`zip` repeat 1)
    words    = wordsBy (not . isAlphaNum) $ map toLower message
