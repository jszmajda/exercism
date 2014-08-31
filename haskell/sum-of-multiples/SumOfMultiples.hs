module SumOfMultiples (sumOfMultiples, sumOfMultiplesDefault) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum multiples
  where
    multiples  = filter isMultiple [1..(limit - 1)]
    isMultiple = (`any` factors) . ((0 ==) .: mod)

sumOfMultiplesDefault :: Integer -> Integer
sumOfMultiplesDefault = sumOfMultiples [3,5]

f .: g = \x y -> f (g x y)
