{-# LANGUAGE TupleSections #-}
module DNA (count, nucleotideCounts) where

import qualified Data.Map.Strict as M

count :: Char -> String -> Int
count n
  | elem n "GATCU" = count' n
  | otherwise = error $ "invalid nucleotide " ++ show n

count' :: Char -> String -> Int
count' n s = length $ filter ((==) n) s

nucleotideCounts :: String -> M.Map Char Int
nucleotideCounts s = M.fromListWith (+) $ map (,0) "ATCG" ++ map (,1) s
