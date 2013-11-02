module School (School(..), add, empty, sorted, grade) where

import Data.List (sort)
import qualified Data.IntMap.Strict as M

data School = Sch { schoolData :: ( M.IntMap [String] ) }

empty :: School
empty = Sch $ M.empty

add :: Int -> String -> School -> School
add g n s = Sch $ M.insertWith (++) g [n] $ schoolData s

sorted :: School -> [(Int, [String])]
sorted s = M.toAscList $ M.map (sort) $ schoolData s

grade :: Int -> School -> [String]
grade g s = M.findWithDefault [] g $ schoolData s
