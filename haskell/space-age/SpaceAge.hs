module SpaceAge (Planet(..), ageOn) where

data Planet =
  Earth | Mercury | Venus | Mars | Jupiter | Saturn | Uranus | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds / yearLength planet

yearLength :: Planet -> Float
yearLength Earth   = 31557600.0
yearLength Mercury = ye * 0.2408467
yearLength Venus   = ye * 0.61519726
yearLength Mars    = ye * 1.8808158
yearLength Jupiter = ye * 11.862615
yearLength Saturn  = ye * 29.447498
yearLength Uranus  = ye * 84.016846
yearLength Neptune = ye * 164.79132

ye = yearLength Earth
