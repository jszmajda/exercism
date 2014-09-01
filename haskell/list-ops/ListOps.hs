module ListOps
  ( length
  , reverse
  , map
  , filter
  , foldr
  , foldl'
  , (++)
  , concat
  ) where

import Prelude hiding
  ( length, reverse, map, filter, foldr, (++), concat )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ s []     = s
foldl' f s (x:xs) = foldl' f (f (seq s s) x) xs

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ s [] = s
foldr f s (x:xs) = f x (foldr f s xs)

length :: [a] -> Int
length [] = 0
length (x:xs) = 1 + length xs

reverse :: [a] -> [a]
reverse []     = []
reverse (x:xs) = reverse xs ++ [x]

map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x:xs) = f x : map f xs

filter :: (a -> Bool) -> [a] -> [a]
filter f []     = []
filter f (x:xs) | f x       = x : filter f xs
                | otherwise =     filter f xs

(++) :: [a] -> [a] -> [a]
xs ++ [] = xs
[] ++ ys = ys
(x:xs) ++ ys = x : (xs ++ ys)

concat :: [[a]] -> [a]
concat = foldr (++) []
