module ETL (transform) where

import qualified Data.Map as M
import Data.List (foldl')
import Data.Char (toLower)

transform :: M.Map Int [String] -> M.Map String Int
transform = fst . M.mapAccumWithKey accum base
  where base = M.empty :: M.Map String Int

accum :: M.Map String Int -> Int -> [String] -> (M.Map String Int, Int)
accum z score letters = (foldInsert z score letters, score)

foldInsert :: M.Map String Int -> Int -> [String] -> M.Map String Int
foldInsert z score = foldl' (\ z l -> M.insert (tl l) score z) z
  where tl = map toLower
