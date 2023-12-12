import Text.Printf

-- | The middle of three integers.
mid :: Integer -> Integer -> Integer -> Integer
mid a b c
    | (b <= a) && (a <= c) = a
    | (a <= b) && (b <= c) = b
    | (a <= c) && (c <= b) = c
    | otherwise = a

main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let c = 3 :: Integer
    printf "%d, %d, %d: %d\n" a b c $ mid a b c
    printf "%d, %d, %d: %d\n" (-a) b c $ mid (-a) b c
    printf "%d, %d, %d: %d\n" a (-b) c $ mid a (-b) c
    printf "%d, %d, %d: %d\n" a b (-c) $ mid a b (-c)
