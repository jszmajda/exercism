module Binary (toDecimal) where

toDecimal :: String -> Int
toDecimal s = sum $ numbered powers
  where
    numbered = map (\(a,b) -> if a == '1' then b else 0)
    powers = zip (reverse s) $ iterate (*2) 1
