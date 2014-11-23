module Roman (numerals) where

numerals :: Int -> String
numerals d = millions ++ thousands ++ hundreds ++ tens
  where
    millions  = replicate (d `div` 1000) 'M'
    thousands = scaleSym 'C' 'D' 'M' d 2
    hundreds  = scaleSym 'X' 'L' 'C' d 1
    tens      = scaleSym 'I' 'V' 'X' d 0

scaleSym :: Char -> Char -> Char -> Int -> Int -> String
scaleSym b f n d scale = tenSym b f n x
  where
    x = d `mod` 10 ^ (scale + 1) `div` 10 ^ scale

-- d is always scaled to the current symbol size
tenSym :: Char -> Char -> Char -> Int -> String
tenSym _ _ _ 0 = []
tenSym base five next d | d == 9 = [base, next]
                        | d == 4 = [base, five]
                        | d >= 5 = five : tenSym base five next (d - 5)
                        | otherwise = replicate d base
