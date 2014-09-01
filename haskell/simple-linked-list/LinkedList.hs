module LinkedList (nil, new, datum, next, isNil, toList, fromList, reverseLinkedList) where

import Data.Maybe

data Element = Elem { _datum :: Maybe Int, _next :: Maybe Element }

nil :: Element
nil = Elem Nothing Nothing

new :: Int -> Element -> Element
new d e = Elem (Just d) (Just e)
-- TODO find a function :: (m a -> m b -> c) -> (a -> m a) -> (b -> m b) -> (m a -> m b)
--   to pass to Elem?

datum :: Element -> Int
datum = fromJust . _datum

next :: Element -> Element
next = fromJust . _next

isNil :: Element -> Bool
isNil (Elem Nothing _) = True
isNil (Elem _       _) = False

toList :: Element -> [Int]
toList (Elem Nothing  Nothing ) = []
toList (Elem (Just d) Nothing ) = [d]
toList (Elem Nothing  (Just n)) = toList n
toList (Elem (Just d) (Just n)) = d : toList n

fromList :: [Int] -> Element
fromList []     = nil
fromList (x:xs) = Elem (Just x) $ Just (fromList xs)

reverseLinkedList :: Element -> Element
reverseLinkedList = fromList . reverse . toList
