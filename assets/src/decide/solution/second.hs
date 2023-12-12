import Text.Printf

-- | A reimplementation of the function "snd".
second :: (a, b) -> b
second (_, y) = y

main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let s = "a"
    let t = "b"
    let x = 'x'
    let y = 'y'
    -- Same data type in each pair.
    printf "(%d, %d) -> %d\n" a b $ second (a, b)
    printf "(%s, %s) -> %s\n" s t $ second (s, t)
    printf "(%c, %c) -> %c\n" x y $ second (x, y)
    -- Mixed data type in each pair.
    printf "(%d, %s) -> %s\n" b t $ second (b, t)
    printf "(%s, %c) -> %c\n" s y $ second (s, y)
    printf "(%c, %d) -> %d\n" y b $ second (y, b)
