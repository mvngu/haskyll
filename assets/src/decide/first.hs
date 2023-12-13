import Text.Printf

-- | A reimplementation of the function "fst".
firstA :: (a, b) -> a
firstA (x, _) = x

-- | An implementation of the function "fst" for lists.
firstB :: [a] -> a
firstB [x, _] = x

-- | An implementation of the function "fst" for lists.
firstC :: [a] -> a
firstC (x:xs) = x

-- | An implementation of the function "fst" for lists.
firstD :: [a] -> a
firstD []     = error "Empty list"
firstD (x:xs) = x

main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let s = "a"
    let t = "b"
    let x = 'x'
    let y = 'y'
    -- Same data type in each pair.
    printf "(%d, %d) -> %d\n" a b $ firstA (a, b)
    printf "(%s, %s) -> %s\n" s t $ firstA (s, t)
    printf "(%c, %c) -> %c\n" x y $ firstA (x, y)
    -- Mixed data type in each pair.
    printf "(%d, %s) -> %d\n" b t $ firstA (b, t)
    printf "(%s, %c) -> %s\n" s y $ firstA (s, y)
    printf "(%c, %d) -> %c\n" y b $ firstA (y, b)
    -- List version.
    printf "[%d, %d] -> %d\n" a b $ firstB [a, b]
    printf "[%s, %s] -> %s\n" s t $ firstB [s, t]
    printf "[%c, %c] -> %c\n" x y $ firstB [x, y]
    -- A third implementation.
    printf "[%d, %d] -> %d\n" a b $ firstC [a, b]
    printf "[%d, %d, %d] -> %d\n" a b (-b) $ firstC [a, b, -b]
    printf "[%c, %c] -> %c\n" x y $ firstC [x, y]
    printf "[%c, %c, %c] -> %c\n" x y x $ firstC [x, y, x]
    -- A fourth implementation.
    printf "[%d, %d] -> %d\n" a b $ firstD [a, b]
    printf "[%d, %d, %d] -> %d\n" a b (-a) $ firstD [a, b, -a]
    printf "[%c, %c] -> %c\n" x y $ firstD [x, y]
    printf "[%c, %c, %c] -> %c\n" x y y $ firstD [x, y, y]
