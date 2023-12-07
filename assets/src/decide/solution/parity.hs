import Text.Printf

-- Whether an integer is even or odd.
main = do
    putStrLn "Enter an integer."
    num <- getLine
    let n = read num :: Integer
    let parity =
            if (mod n 2) == 0
                then "even"
                else "odd"
    printf "%d is %s\n" n parity
