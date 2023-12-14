import Text.Printf

-- | Summing a list of integers.
add :: (Integral a) => [a] -> a
add []     = 0
add (x:xs) = x + add xs

main = do
    let a = [] :: [Integer]
    let b = [1, 2, 3] :: [Integer]
    let c = [3, 5, 7, 11, 13] :: [Integer]
    let d = [1,4 .. 100] :: [Integer]
    printf "%d: %s\n" (add a) $ show $ sum a == add a
    printf "%d: %s\n" (add b) $ show $ sum b == add b
    printf "%d: %s\n" (add c) $ show $ sum c == add c
    printf "%d: %s\n" (add d) $ show $ sum d == add d
