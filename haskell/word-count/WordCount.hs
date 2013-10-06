module WordCount (wordCount) where

import Data.Char
import Data.List
import qualified Data.Map as Map

wordCount :: String -> Map.Map String Int
wordCount s = Map.fromList $ map counts wordCollection
  where
    counts list    = (head list, length list)
    wordCollection = group $ sort $ words lowers
    lowers         = map sanitize s
    sanitize c     = if (not $ isAlphaNum c) then ' ' else toLower c
