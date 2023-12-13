import Text.Printf

-- | An implementation of the function "tail".
rear :: [a] -> [a]
rear []     = error "Empty list"
rear [x]    = []
rear (x:xs) = xs

main = do
    let a = 2 :: Integer
    let b = 3 :: Integer
    let c = 5 :: Integer
    printf "[%d] -> %s\n" a $ show $ rear [a]
    printf "[%d, %d] -> %s\n" a b $ show $ rear [a, b]
    printf "[%d, %d, %d] -> %s\n" c a b $ show $ rear [c, a, b]
