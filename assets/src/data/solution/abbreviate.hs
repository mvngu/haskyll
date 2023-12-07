import Data.Char
import Text.Printf

-- Abbreviate a two-word phrase.
main = do
    putStrLn "Enter a two-word phrase."
    phrase <- getLine
    let [first, second] = words phrase
    let left = toUpper (head first)
    let right = toUpper (head second)
    putStrLn (printf "%s is abbreviated as %c%c" phrase left right)
