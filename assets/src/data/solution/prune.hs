-- Remove the character at index i in a string.
main = do
    putStrLn "Enter a string."
    str <- getLine
    putStrLn "Enter an integer."
    index <- getLine
    let k = read index :: Int
    let (left, right) = splitAt (k + 1) str
    putStrLn ((init left) ++ right)
