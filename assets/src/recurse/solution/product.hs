import Text.Printf

-- | The product of a list of integers.
prod :: (Integral a) => [a] -> a
prod []     = 1
prod (x:xs) = x * prod xs

main = do
    let a = [] :: [Integer]
    let b = [1, 2, 3] :: [Integer]
    let c = [3, 5, 7, 11, 13] :: [Integer]
    let d = [1,4 .. 100] :: [Integer]
    printf "%d: %s\n" (prod a) $ show $ product a == prod a
    printf "%d: %s\n" (prod b) $ show $ product b == prod b
    printf "%d: %s\n" (prod c) $ show $ product c == prod c
    printf "%d: %s\n" (prod d) $ show $ product d == prod d
