-- The golden ratio.
main = do
    let numer = 1 + (sqrt 5)
    let phi = numer / 2
    putStrLn ("Golden ratio: " ++ show phi)
