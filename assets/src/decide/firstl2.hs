import Text.Printf

-- | An implementation of the function "fst" for lists.
first :: [a] -> a
first (x:xs) = x

main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let c = 3 :: Integer
    let x = 'x'
    let y = 'y'
    let z = 'z'
    printf "[%d, %d] -> %d\n" a b $ first [a, b]
    printf "[%d, %d, %d] -> %d\n" a b c $ first [a, b, c]
    printf "[%c, %c] -> %c\n" x y $ first [x, y]
    printf "[%c, %c, %c] -> %c\n" x y z $ first [x, y, z]
