import Data.Char
import Text.Printf

-- | Reverse the case of a string.
flipCase :: String -> String
flipCase str =
    if isLower $ head str
        then (toUpper $ head str) : tail str
        else (toLower $ head str) : tail str

main = do
    let a = "miss Honey"
    let b = "waltzing Matilda"
    let c = "Banana"
    let d = "23 skidoo"
    printf "%s -> %s\n" a $ flipCase a
    printf "%s -> %s\n" b $ flipCase b
    printf "%s -> %s\n" c $ flipCase c
    printf "%s -> %s\n" d $ flipCase d
