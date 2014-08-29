module Grains (square, total) where

square :: Integral a => a -> a
square n = 2 ^ (n - 1)

total :: Integral a => a
total = 2 ^ 64 - 1
