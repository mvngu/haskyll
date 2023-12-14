-- | Count down to zero.
count :: Integer -> IO ()
count 0 = putStrLn "0. Lift off!"
count n
    | n > 0 = do
        putStrLn $ show n
        count (n - 1)
    | otherwise = error "Must be non-negative integer"

main = do
    count 10
