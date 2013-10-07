import Criterion.Main

toRNA :: String -> String
toRNA strand = map xla strand
  where
    xla 'T' = 'U'
    xla  c  =  c

toRNA' :: String -> String
toRNA' []     = []
toRNA' (x:xs) = translate x : toRNA xs

translate :: Char -> Char
translate 'T' = 'U'
translate  c  =  c

main = defaultMain [
        bgroup "rna" [ bench "recursion" $ nf toRNA' "ACGTGGTCTTAAACGTGGTCTTAAACGTGGTCTTAA"
                     , bench "using map" $ nf toRNA "ACGTGGTCTTAAACGTGGTCTTAAACGTGGTCTTAA"
                     ]
                    ]

