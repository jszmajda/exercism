module Raindrops (convert) where

convert :: Int -> String
convert n = if (not . null) factors then showFactors else show n
  where
    factors      = filter isFactor [3,5,7]
    isFactor     = (== 0) . mod n
    showFactors  = concatMap showFactor factors
    showFactor 3 = "Pling"
    showFactor 5 = "Plang"
    showFactor _ = "Plong"
