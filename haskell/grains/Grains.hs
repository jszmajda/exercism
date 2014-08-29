module Grains (square, total) where

square :: Integral a => a -> a
square n = 2^(n-1)

total :: Integral a => a
total = sum $ map square [1..64]
