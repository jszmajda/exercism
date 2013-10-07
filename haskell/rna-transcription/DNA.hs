module DNA (toRNA) where

toRNA :: String -> String
toRNA strand = map translate strand
  where
    translate 'T' = 'U'
    translate  c  =  c
