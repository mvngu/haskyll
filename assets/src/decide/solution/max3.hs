import Text.Printf

-- | The maximum of three integers.
max3 :: Integer -> Integer -> Integer -> Integer
max3 a b c
    | (a >= b) && (a >= c) = a
    | (b >= a) && (b >= c) = b
    | otherwise = c

main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let c = 3 :: Integer
    let test1 = (max a $ max b c) == (max3 a b c)
    let test2 = (max (-a) $ max b c) == (max3 (-a) b c)
    let test3 = (max a $ max (-b) c) == (max3 a (-b) c)
    let test4 = (max a $ max b (-c)) == (max3 a b (-c))
    printf "%d, %d, %d: %d, %s\n" a b c (max3 a b c) $ show test1
    printf "%d, %d, %d: %d, %s\n" (-a) b c (max3 (-a) b c) $ show test2
    printf "%d, %d, %d: %d, %s\n" a (-b) c (max3 a (-b) c) $ show test3
    printf "%d, %d, %d: %d, %s\n" a b (-c) (max3 a b (-c)) $ show test4
