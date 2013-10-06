module DNA (toRNA) where

toRNA :: String -> String
toRNA []     = []
toRNA (x:xs) = translate x : toRNA xs

translate :: Char -> Char
translate 'T' = 'U'
translate  c  =  c
