import Text.Printf

-- | The second element of a list.
secondA :: [a] -> a
secondA []       = error "Empty list"
secondA [x]      = error "Singleton"
secondA (x:y:xs) = y

-- | The second element of a list.
secondB :: [a] -> a
secondB []      = error "Empty list"
secondB [x]     = error "Singleton"
secondB (_:x:_) = x

main = do
    let a = 2 :: Integer
    let b = 3 :: Integer
    let c = 4 :: Integer
    -- First version.
    printf "[%d, %d] -> %d\n" a b $ secondA [a, b]
    printf "[%d, %d] -> %d\n" b c $ secondA [b, c]
    printf "[%d, %d, %d] -> %d\n" b a c $ secondA [b, a, c]
    printf "[%d, %d, %d, %d] -> %d\n" b (-a) c (-b) $ secondA [b, -a, c, -b]
    -- Second version.
    printf "[%d, %d] -> %d\n" a b $ secondB [a, b]
    printf "[%d, %d] -> %d\n" b c $ secondB [b, c]
    printf "[%d, %d, %d] -> %d\n" b a c $ secondB [b, a, c]
    printf "[%d, %d, %d, %d] -> %d\n" b (-a) c (-b) $ secondB [b, -a, c, -b]
