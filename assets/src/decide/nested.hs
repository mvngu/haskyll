import Text.Printf

-- Relationship between two integers.
main = do
    putStrLn "Enter first integer."
    a <- getLine
    putStrLn "Enter second integer."
    b <- getLine
    let k = read a :: Integer
    let n = read b :: Integer
    let relation =
            if k < n
                then "less than"
                else if k > n
                         then "greater than"
                         else "equal to"
    printf "%s is %s %s\n" a relation b
