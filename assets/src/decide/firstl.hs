import Text.Printf

-- | An implementation of the function "fst" for lists.
first :: [a] -> a
first [x, _] = x

main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let s = "a"
    let t = "b"
    let x = 'x'
    let y = 'y'
    printf "[%d, %d] -> %d\n" a b $ first [a, b]
    printf "[%s, %s] -> %s\n" s t $ first [s, t]
    printf "[%c, %c] -> %c\n" x y $ first [x, y]
