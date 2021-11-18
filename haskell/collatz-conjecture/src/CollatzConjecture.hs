module CollatzConjecture (collatz) where

-- `length` returns Int, `genericLength` coerces to any target Num
import Data.List (genericLength) 

collatz :: Integer -> Maybe Integer
collatz int = if int < 1 then Nothing else Just $ result
  where
    result = genericLength $ takeWhile (/= 1) $ iterate collatzStep int

collatzStep :: Integer -> Integer
collatzStep i = if (even i) then i `div` 2 else i * 3 + 1
