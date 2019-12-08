module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
  | n <= 0    = Nothing
  | otherwise = if (sumOfFactors n) == n
                  then Just Perfect
                  else if (sumOfFactors n) < n
                         then Just Deficient
                         else Just Abundant
  where
    sumOfFactors a = foldl (+) 0 (factors a)
    factors a = filter (isFactorOf a) [1..(a `div` 2)]

isFactorOf :: Int -> Int -> Bool
isFactorOf n x = (n `mod` x) == 0

