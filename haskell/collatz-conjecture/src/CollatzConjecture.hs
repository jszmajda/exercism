module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz int = if int < 1 then Nothing else Just $ result
  where
    result = toInteger $ length $ takeWhile (/= 1) $ iterate collatzStep int

collatzStep :: Integer -> Integer
collatzStep i = if (even i) then i `div` 2 else i * 3 + 1
