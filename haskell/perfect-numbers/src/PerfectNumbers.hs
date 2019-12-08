module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
  | n <= 0          = Nothing
  | aliquotSum == n = Just Perfect
  | aliquotSum < n  = Just Deficient
  | otherwise       = Just Abundant
  where
    aliquotSum = sum $ filter ((0 ==) . mod n) [1..(n `div` 2)]
