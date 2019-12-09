module Isogram (isIsogram) where

import qualified Data.Text as T
import Data.List (sort)
import Data.Char (isAlpha)

isIsogram :: String -> Bool
isIsogram t = not $ any (\g -> T.length g > 1) grouped
  where
    grouped   = T.group filtered
    filtered  = T.filter isAlpha downcased
    downcased = T.toLower sorted
    sorted    = T.pack $ sort t
