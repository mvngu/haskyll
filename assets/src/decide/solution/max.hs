import Text.Printf

-- The maximum of two integers.
main = do
    putStrLn "Enter first integer."
    a <- getLine
    putStrLn "Enter second integer."
    b <- getLine
    let k = read a :: Integer
    let n = read b :: Integer
    let max =
            if k > n
                then k
                else n
    printf "Maximum of %s and %s: %d\n" a b max
