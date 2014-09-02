module SpaceAge (Planet(..), ageOn) where

import Control.Arrow

data Planet =
  Mercury | Venus | Earth | Mars | Jupiter | Saturn | Uranus | Neptune

ageOn :: Planet -> Float -> Float
ageOn = divideBy . yearLength
  where divideBy = (*) . (1 /)

yearLength :: Planet -> Float
yearLength p = earthSeconds * case p of
  Earth   -> 1.0
  Mercury -> 0.2408467
  Venus   -> 0.61519726
  Mars    -> 1.8808158
  Jupiter -> 11.862615
  Saturn  -> 29.447498
  Uranus  -> 84.016846
  Neptune -> 164.79132

earthSeconds :: Float
earthSeconds = 31557600.0
