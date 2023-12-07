import Text.Printf

-- | The maximum of two integers.
maxInt :: Integer -> Integer -> Integer
maxInt x y =
    if x > y
        then x
        else y

main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let c = 3 :: Integer
    printf "Max of %d and %d: %d\n" a b $ maxInt a b
    printf "Max of %d and %d: %d\n" (-b) c $ maxInt (-b) c
    printf "Max of %d and %d: %d\n" c c $ maxInt c c
