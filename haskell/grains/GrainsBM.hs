module GrainsBM where
import Data.List (foldl')
import Data.Foldable (foldr')

{-# INLINE square #-}
square :: Integral a => a -> a
square n = 2^(n-1)

{-# INLINE total #-}
total :: Integral a => [a] -> a
-- total   _ = sum $ map square [1..64]
total   l = sum $ map square l
totalL  l = foldl (+) 0 $ map square l
totalL' l = foldl' (+) 0 $ map square l
totalR  l = foldr (+) 0 $ map square l
totalR' l = foldr' (+) 0 $ map square l
