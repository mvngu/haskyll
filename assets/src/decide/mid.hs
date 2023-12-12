import Text.Printf

-- | The middle element of a tuple of three elements.
mid :: (a, b, c) -> b
mid (_, x, _) = x

main = do
    let a = 1 :: Integer
    let b = '2'
    let c = True
    printf "(%d, %c, %s) -> %c\n" a b (show c) $ mid (a, b, c)
    printf "(%d, %s, %c) -> %s\n" a (show c) b $ show $ mid (a, c, b)
    printf "(%c, %d, %s) -> %d\n" b a (show c) $ mid (b, a, c)
