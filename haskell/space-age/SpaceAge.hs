module SpaceAge (Planet(..), ageOn) where

data Planet =
  Mercury | Venus | Earth | Mars | Jupiter | Saturn | Uranus | Neptune

ageOn :: Planet -> Float -> Float
ageOn = divideBy . yearLength
  where divideBy = (*) . (1 /)

yearLength :: Planet -> Float
yearLength Earth   = 31557600.0
yearLength Mercury = e * 0.2408467
yearLength Venus   = e * 0.61519726
yearLength Mars    = e * 1.8808158
yearLength Jupiter = e * 11.862615
yearLength Saturn  = e * 29.447498
yearLength Uranus  = e * 84.016846
yearLength Neptune = e * 164.79132

e = yearLength Earth
