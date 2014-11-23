module Triangle (TriangleType(..), triangleType) where

import Data.List

data TriangleType = Equilateral | Isosceles | Scalene | Illogical
  deriving (Show, Eq)

-- The sum of the lengths of any two sides of a triangle always exceeds the
-- length of the third side, a principle known as the _triangle
-- inequality_.
triangleType :: Int -> Int -> Int -> TriangleType
triangleType a b c
  | invalid                    = Illogical
  | a == b && a == c           = Equilateral
  | a == b || a == c || b == c = Isosceles
  | a /= b && a /= c && b /= c = Scalene
  | otherwise                  = Illogical -- exhausting patterns
  where
    invalid = any (\[x,y,z] -> x >= (y + z)) sideCombos
    sideCombos = permutations asList
    asList = [a,b,c]
