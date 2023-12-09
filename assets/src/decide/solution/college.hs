import Text.Printf

-- | The size of a college in the USA.
size :: Integer -> String
size x
    | x <= 0 = "Invalid number of students"
    | x < 5000 = "small"
    | (5000 <= x) && (x <= 15000) = "medium"
    | x > 15000 = "large"

main = do
    let a = -1 :: Integer
    let b = 2001 :: Integer
    let c = 5600 :: Integer
    let d = 15555 :: Integer
    printf "%d -> %s\n" a $ size a
    printf "%d -> %s\n" b $ size b
    printf "%d -> %s\n" c $ size c
    printf "%d -> %s\n" d $ size d
