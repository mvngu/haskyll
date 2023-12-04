import           Text.Printf

-- Extract a substring between indices i and j, inclusive.
main = do
    putStrLn "Enter a string."
    str <- getLine
    putStrLn "Enter start index."
    start <- getLine
    putStrLn "Enter end index."
    end <- getLine
    let i = (read start :: Int)
    let j = (read end :: Int) + 1
    let sub = drop i (take j str)
    putStrLn (printf "Substring of %s is %s" str sub)
