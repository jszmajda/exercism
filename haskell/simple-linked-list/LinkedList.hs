module LinkedList where

data Element = Elem (Maybe Int) (Maybe Element)

nil :: Element
nil = Elem Nothing Nothing

new :: Int -> Element -> Element
new d e = Elem (Just d) (Just e)

datum :: Element -> Int
datum (Elem Nothing  _) = undefined
datum (Elem (Just d) _) = d

next :: Element -> Element
next (Elem _ Nothing)  = undefined
next (Elem _ (Just n)) = n

isNil :: Element -> Bool
isNil (Elem Nothing _) = True
isNil (Elem _       _) = False

toList :: Element -> [Int]
toList (Elem (Just d) Nothing)  = [d]
toList (Elem (Just d) (Just n)) = d : toList n
toList (Elem Nothing _        ) = []

fromList :: [Int] -> Element
fromList []     = nil
fromList (x:xs) = Elem (Just x) $ Just (fromList xs)

reverseLinkedList :: Element -> Element
reverseLinkedList = fromList . reverse . toList
