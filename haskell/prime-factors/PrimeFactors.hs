module PrimeFactors (primeFactors) where

import Data.List (find)
import Data.Maybe (fromJust)
import Data.Numbers.Primes (primes) -- cabal install primes
-- import qualified Data.Set as S

primeFactors :: Int -> [Int]
primeFactors 0 = []
primeFactors 1 = []
primeFactors 2 = [2]
primeFactors n = factor : primeFactors (n `div` factor)
  where
    factor = fromJust $ find (\f -> n `mod` f == 0) primes
--     primes = primesTo n
--
-- primesTo :: Int -> [Int]
-- primesTo m = eratos [2..m]  where
--    eratos :: [Int] -> [Int]
--    eratos []     = []
--    eratos (p:xs) = p : eratos (S.toList (S.difference (S.fromList xs) (S.fromList [p, p+p..m])))
