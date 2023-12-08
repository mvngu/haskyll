import Text.Printf

-- | The minimum of two integers.
minInt :: Integer -> Integer -> Integer
minInt x y =
    if x < y
        then x
        else y

main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let c = 3 :: Integer
    printf "Min of %d and %d: %d\n" a b $ minInt a b
    printf "Min of %d and %d: %d\n" (-b) c $ minInt (-b) c
    printf "Min of %d and %d: %d\n" c c $ minInt c c
