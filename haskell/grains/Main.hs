import Criterion.Main
import GrainsBM

main = defaultMain [
  -- bgroup "square" [ bench "1"  $ whnf square 1
  --                 , bench "5"  $ whnf square 5
  --                 , bench "9"  $ whnf square 9
  --                 , bench "11" $ whnf square 11
  --                 ]
  bgroup "total" [  bench "total"    $ whnf total l
                  , bench "totalL"   $ whnf totalL l
                  , bench "totalL'"  $ whnf totalL' l
                  , bench "totalR"   $ whnf totalR l
                  , bench "totalR'"  $ whnf totalR' l
                  ]
  ]
  where l = [1..64]
