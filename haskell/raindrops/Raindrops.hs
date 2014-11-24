module Raindrops (convert) where

import Data.List
import Data.Maybe (maybeToList)

convert :: Int -> String
convert n  = convertFacts (facts n) n

convertFacts :: [Int] -> Int -> String
convertFacts [] n = show n
convertFacts fs _ = concatMap toDrop fs
  where
    toDrop 3 = "Pling"
    toDrop 5 = "Plang"
    toDrop _ = "Plong"

facts :: Int -> [Int]
facts n = nub $ maybeToList factor ++ rest factor
  where
    rest (Just r) = facts (n `div` r)
    rest Nothing = []
    factor = find (\p -> n `mod` p == 0) primes
    primes = [3,5,7]
