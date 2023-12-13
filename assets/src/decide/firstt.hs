import Text.Printf

-- | A reimplementation of the function "fst".
first :: (a, b) -> a
first (x, _) = x

main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let s = "a"
    let t = "b"
    let x = 'x'
    let y = 'y'
    -- Same data type in each pair.
    printf "(%d, %d) -> %d\n" a b $ first (a, b)
    printf "(%s, %s) -> %s\n" s t $ first (s, t)
    printf "(%c, %c) -> %c\n" x y $ first (x, y)
    -- Mixed data type in each pair.
    printf "(%d, %s) -> %d\n" b t $ first (b, t)
    printf "(%s, %c) -> %s\n" s y $ first (s, y)
    printf "(%c, %d) -> %c\n" y b $ first (y, b)
