module Raindrops (convert) where

convert :: Int -> String
convert n | fact 105 = "PlingPlangPlong"
          | fact 35  = "PlangPlong"
          | fact 21  = "PlingPlong"
          | fact 15  = "PlingPlang"
          | fact 7   = "Plong"
          | fact 5   = "Plang"
          | fact 3   = "Pling"
          | otherwise = show n
  where
    fact = (== 0) . mod n
