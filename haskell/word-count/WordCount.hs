module WordCount (wordCount) where

import Data.Char
import qualified Data.Map as M

wordCount :: String -> M.Map String Int
wordCount message = foldl collate M.empty wordCollection
  where
    collate set k   = M.insert k (countUp set k) set
    countUp set k   = (M.findWithDefault 0 k set) + 1
    wordCollection  = words lowers
    lowers          = map sanitize message
    sanitize c      = if (not . isAlphaNum) c then ' ' else toLower c

-- wordCount :: String -> Map String Int
-- wordCount message = fromList $ map counts wordCollection
--   where
--     counts list    = (head list, length list)
--     wordCollection = group $ sort $ words lowers
--     lowers         = map sanitize message
--     sanitize c     = if (not . isAlphaNum) c then ' ' else toLower c
