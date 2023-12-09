import Text.Printf

-- The minimum of two integers.
main = do
    putStrLn "Enter first integer."
    a <- getLine
    putStrLn "Enter second integer."
    b <- getLine
    let k = read a :: Integer
    let n = read b :: Integer
    let min =
            if k < n
                then k
                else n
    printf "Minimum of %s and %s: %d\n" a b min
