import Data.Char
import Text.Printf

-- | Convert the first character of a string to uppercase.
capitalize :: String -> String
capitalize str = (toUpper $ head str) : (tail str)

main = do
    let a = "ayyy!"
    let b = "to bee or not two bees"
    let c = "42 is a number"
    printf "%s -> %s\n" a $ capitalize a
    printf "%s -> %s\n" b $ capitalize b
    printf "%s -> %s\n" c $ capitalize c
