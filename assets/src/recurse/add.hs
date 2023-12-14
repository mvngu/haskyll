import Text.Printf

-- | Sum of all positive integers from 1 to n, inclusive.
add :: (Integral a) => a -> a
add 1 = 1
add n
    | n > 1 = n + add (n - 1)
    | otherwise = error "Must be positive integer"

-- | The triangular numbers.
trinum :: (Integral a) => a -> a
trinum 0 = 0
trinum 1 = 1
trinum n
    | n > 1 = n + trinum (n - 1)
    | otherwise = error "Must be positive integer"

main = do
    let a = 3 :: Integer
    let b = 6 :: Integer
    let c = 11 :: Integer
    let test1 = (sum [1 .. a] == add a) && (add a == trinum a)
    let test2 = (sum [1 .. b] == add b) && (add b == trinum b)
    let test3 = (sum [1 .. c] == add c) && (add c == trinum c)
    printf "%d -> %d, check: %s\n" a (add a) $ show test1
    printf "%d -> %d, check: %s\n" b (add b) $ show test2
    printf "%d -> %d, check: %s\n" c (add c) $ show test3
