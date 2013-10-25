module DNA (hammingDistance) where

hammingDistance :: String -> String -> Int
hammingDistance a b = length $ filter ne $ pairs
  where
    ne    = uncurry (/=)
    pairs = zip a b

-- for fun, @pl's refactoring:
-- hammingDistance = ((length . filter (uncurry (/=))) .) . zip
