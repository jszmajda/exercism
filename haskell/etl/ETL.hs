module ETL (transform) where

import qualified Data.Map as M
import Data.Char (toLower)

transform :: M.Map Int [String] -> M.Map String Int
transform = M.fromList . remap . M.toList
  where remap = concatMap unwindPair

unwindPair :: (Int, [String]) -> [(String, Int)]
unwindPair (score, letters) = map (\ l -> (tl l, score)) letters
  where tl = map toLower
