module LinkedList (nil, new, datum, next, isNil, toList, fromList, reverseLinkedList) where

import Data.Maybe

data Element = Nil | Elem { datum :: Int, next :: Element } deriving Show

nil :: Element
nil = Nil

new :: Int -> Element -> Element
new = Elem

isNil :: Element -> Bool
isNil Nil = True
isNil _ = False

toList :: Element -> [Int]
toList Nil = []
toList (Elem d n) = d : toList n

fromList :: [Int] -> Element
fromList = foldr Elem Nil

reverseLinkedList :: Element -> Element
reverseLinkedList = replayBackwards Nil

replayBackwards :: Element -> Element -> Element
replayBackwards acc Nil        = acc
replayBackwards acc (Elem d n) = replayBackwards (Elem d acc) n
