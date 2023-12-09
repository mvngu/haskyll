import Text.Printf

-- | Relationship between two integers.
relation :: Integer -> Integer -> String
relation a b
    | a < b = "less than"
    | a > b = "greater than"
    | otherwise = "equal to"

main = do
    putStrLn "Enter first integer."
    a <- getLine
    putStrLn "Enter second integer."
    b <- getLine
    let k = read a :: Integer
    let n = read b :: Integer
    printf "%s is %s %s\n" a (relation k n) b
