import Text.Printf

-- | Whether an integer is even or odd.
parity :: Integer -> String
parity x =
    if (mod x 2) == 0
        then "even"
        else "odd"

main = do
    putStrLn "Enter an integer."
    num <- getLine
    let n = read num :: Integer
    printf "%d is %s\n" n $ parity n
