module Roman (numerals) where

numerals :: Int -> String
numerals d = millions ++ thousands ++ hundreds ++ tens
  where
    tBase = d     `mod` 1000
    hBase = tBase `mod` 100
    millions  = replicate (d `div` 1000) 'M'
    thousands = tenSym 'C' 'D' 'M' (tBase `div` 100)
    hundreds  = tenSym 'X' 'L' 'C' (hBase `div` 10)
    tens      = tenSym 'I' 'V' 'X' (hBase `mod` 10)

-- d is always scaled to the current symbol size
tenSym :: Char -> Char -> Char -> Int -> String
tenSym _ _ _ 0 = []
tenSym base five next d | d == 9 = [base, next]
                        | d == 4 = [base, five]
                        | d >= 5 = five : tenSym base five next (d - 5)
                        | otherwise = replicate d base
