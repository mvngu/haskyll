import Text.Printf

-- | An implementation of the function "last".
end :: [a] -> a
end [] = error "Empty list"
end x  = first $ reverse x

-- | An implementation of the function "fst" for lists.
first :: [a] -> a
first []     = error "Empty list"
first (x:xs) = x

main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let c = 3 :: Integer
    let x = 'x'
    let y = 'y'
    let z = 'z'
    printf "[%d, %d] -> %d\n" a b $ end [a, b]
    printf "[%d, %d, %d] -> %d\n" a b c $ end [a, b, c]
    printf "[%c, %c] -> %c\n" x y $ end [x, y]
    printf "[%c, %c, %c] -> %c\n" x y z $ end [x, y, z]
