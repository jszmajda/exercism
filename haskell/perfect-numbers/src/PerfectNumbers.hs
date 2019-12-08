module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
  | n <= 0    = Nothing
  | otherwise = Just $ classify' sumOfFactors
  where
    sumOfFactors = foldl (+) 0 factors
    factors = filter ((0 ==) . mod n) [1..(n `div` 2)]
    classify' a
      | a == n    = Perfect
      | a > n     = Abundant
      | otherwise = Deficient
