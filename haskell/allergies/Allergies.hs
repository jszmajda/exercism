module Allergies (Allergen(..), isAllergicTo, allergies) where

import Data.Maybe

data Allergen = Eggs | Peanuts | Shellfish | Strawberries | Tomatoes | Chocolate | Pollen | Cats
  deriving (Show, Eq)

instance Enum Allergen where
  toEnum a = fromJust $ lookup a values

values :: [(Allergen, Int)]
values = zip [Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats] powers
  where powers = iterate (*2) 1

isAllergicTo = undefined

allergies = undefined
