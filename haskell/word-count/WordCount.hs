module WordCount (wordCount) where

import Data.Char
import Data.List
import Data.Map (Map, fromList)

wordCount :: String -> Map String Int
wordCount message = fromList $ map counts wordCollection
  where
    counts list    = (head list, length list)
    wordCollection = group $ sort $ words lowers
    lowers         = map sanitize message
    sanitize c     = if (not . isAlphaNum) c then ' ' else toLower c
