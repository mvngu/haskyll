import Text.Printf

-- | The absolute value of a number.
absolute :: Double -> Double
absolute x =
    if x >= 0
        then x
        else -x

main = do
    putStrLn "Enter a number."
    num <- getLine
    let n = read num :: Double
    printf "Absolute value = %f\n" $ absolute n
