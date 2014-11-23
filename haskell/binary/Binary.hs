module Binary (toDecimal) where

import Data.Sequence (fromList, foldrWithIndex)

toDecimal :: String -> Int
toDecimal = foldrWithIndex (baseIndexSum 2) 0 . fromList . reverse

baseIndexSum :: Int -> Int -> Char -> Int -> Int
baseIndexSum b i '1' z = z + b ^ i
baseIndexSum _ _  _  z = z
