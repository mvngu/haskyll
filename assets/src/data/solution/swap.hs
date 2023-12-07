import Text.Printf

-- Swap the first and last characters of a string with each other.
main = do
    putStrLn "Enter a string."
    str <- getLine
    let front = head str : ""
    let end = last str : ""
    let mid = init (tail str)
    putStrLn (printf "%s%s%s" end mid front)
