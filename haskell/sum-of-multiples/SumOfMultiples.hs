module SumOfMultiples (sumOfMultiples, sumOfMultiplesDefault) where

type Factor = Integer
type Limit  = Integer
type Sum    = Integer

sumOfMultiples :: [Factor] -> Limit -> Sum
sumOfMultiples factors limit = sum multiples
  where
    multiples = [ x | x <- [1..(limit - 1)], valid x]
    valid i = any (\x -> 0 == (i `mod` x)) factors

sumOfMultiplesDefault :: Limit -> Sum
sumOfMultiplesDefault = sumOfMultiples [3,5]
