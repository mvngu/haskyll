-- | The Collatz function.
colf :: Integer -> Integer
colf n
    | n < 1 = error "Must be positive integer"
    | (mod n 2) == 0 = div n 2
    | otherwise = (3 * n) + 1

-- | The Collatz sequence.
cols :: Integer -> IO ()
cols 1 = putStrLn "1"
cols n = do
    putStrLn $ show $ colf n
    cols (n - 1)

main = do
    cols 50
