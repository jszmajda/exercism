module ETL (transform) where

import qualified Data.Map as M
import Data.List (foldl')
import Data.Char (toLower)

transform :: M.Map Int [String] -> M.Map String Int
transform = fst . M.mapAccumWithKey accum base
  where base = M.empty :: M.Map String Int

accum :: M.Map String Int -> Int -> [String] -> (M.Map String Int, Int)
accum z score letters = (foldInsert, score)
  where
    foldInsert = foldl' (\ z l -> M.insert (tl l) score z) z letters
    tl         = map toLower
