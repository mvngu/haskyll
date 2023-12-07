import Data.Char
import Text.Printf

-- | Convert the first character of a string to uppercase.
capitalize :: String -> String
capitalize str = (toUpper $ head str) : (tail str)

-- | Remove the first and last characters of a string, reverse the
-- string, then capitalize the result.
chopSuey :: String -> String
chopSuey str = do
    let torso = init $ tail str
    capitalize $ reverse torso

main = do
    let a = "!yyyay"
    let b = "clive evils"
    let c = "8caterpillar-"
    printf "%s -> %s\n" a $ chopSuey a
    printf "%s -> %s\n" b $ chopSuey b
    printf "%s -> %s\n" c $ chopSuey c
