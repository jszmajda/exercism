module SumOfMultiples (sumOfMultiples, sumOfMultiplesDefault) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum multiples
  where
    multiples    = filter isMultiple [1..(limit - 1)]
    isMultiple i = any' $ (0 ==) . mod i
    any'         = flip any factors
    -- this pointfree alternative is confusing to read IMO
    -- isMultiple = any' . ((0 ==) .) . mod

sumOfMultiplesDefault :: Integer -> Integer
sumOfMultiplesDefault = sumOfMultiples [3,5]
