import Text.Printf

-- The absolute value of a number.
main = do
    putStrLn "Enter a number."
    num <- getLine
    let n = read num :: Double
    if n >= 0
        then printf "Absolute value = %s\n" $ show n
        else do
            let abs = n * (-1)
            printf "Absolute value = %s\n" $ show abs
