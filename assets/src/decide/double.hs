import Text.Printf

-- Double an integer.
main = do
    putStrLn "Enter an integer."
    num <- getLine
    let n = read num :: Integer
    if n < 0
        then putStrLn "I'm positive the number is negative"
        else do
            let nn = 2 * n
            printf "It's Dublin: %d\n" nn
