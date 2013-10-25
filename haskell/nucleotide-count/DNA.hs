module DNA (count, nucleotideCounts) where

import Data.List (filter)
import Data.Map (fromList, Map)

count :: Char -> String -> Int
count n
  | elem n "GATCU" = count' n
  | otherwise = error $ "invalid nucleotide " ++ show n

count' :: Char -> String -> Int
count' n "" = 0
count' n s  = length $ filter ((==) n) s

nucleotideCounts :: String -> Map Char Int
nucleotideCounts s = fromList $ map counts "ATCG"
  where
    counts l = (l, count l s)
