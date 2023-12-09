-- | Remove the middle character(s) of a string.
dropMid :: String -> String
dropMid str = do
    let k = length str
    let (left, right) = splitAt (div k 2) str
    if (mod k 2) == 0
        then (init left) ++ (tail right)
        else left ++ (tail right)

main = do
    putStrLn "Enter a string."
    str <- getLine
    putStrLn $ dropMid str
