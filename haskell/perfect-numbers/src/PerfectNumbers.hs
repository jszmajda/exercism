module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
  | n <= 0    = Nothing
  | otherwise = Just $ classify' (sumOfFactors n) n
  where
    sumOfFactors a = foldl (+) 0 (factors a)
    factors a = filter (isFactorOf a) [1..(a `div` 2)]
    classify' a b
      | a == b    = Perfect
      | a > b     = Abundant
      | otherwise = Deficient

isFactorOf :: Int -> Int -> Bool
isFactorOf n x = (n `mod` x) == 0

