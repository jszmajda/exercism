module School (School(..), add, empty, sorted, grade) where

import Data.List (sort)
import qualified Data.IntMap.Strict as M

data School = Sch { schoolData :: M.IntMap [String] }

empty :: School
empty = Sch M.empty

add :: Int -> String -> School -> School
add g n = Sch . M.insertWith (++) g [n] . schoolData

sorted :: School -> [(Int, [String])]
sorted = M.toAscList . M.map sort . schoolData

grade :: Int -> School -> [String]
grade g = M.findWithDefault [] g . schoolData
