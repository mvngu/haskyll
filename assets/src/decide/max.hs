import Text.Printf

-- | The maximum of two integers.
maxInt :: Integer -> Integer -> Integer
maxInt x y =
    if x > y
        then x
        else y

-- | The maximum of two integers.
maxIntg :: Integer -> Integer -> Integer
maxIntg x y
    | x > y = x
    | otherwise = y

main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let c = 3 :: Integer
    -- Conditional expressions.
    printf "Max of %d and %d: %d\n" a b $ maxInt a b
    printf "Max of %d and %d: %d\n" (-b) c $ maxInt (-b) c
    printf "Max of %d and %d: %d\n" c c $ maxInt c c
    -- Guarded equations.
    printf "Max of %d and %d: %d\n" a b $ maxIntg a b
    printf "Max of %d and %d: %d\n" (-b) c $ maxIntg (-b) c
    printf "Max of %d and %d: %d\n" c c $ maxIntg c c
