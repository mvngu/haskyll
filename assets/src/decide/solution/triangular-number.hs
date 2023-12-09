import Text.Printf

-- | The triangular number.
trinum :: Integer -> Integer
trinum x = div (x * (x + 1)) 2

main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let c = 3 :: Integer
    let d = 100 :: Integer
    printf "%d -> %d\n" a $ trinum a
    printf "%d -> %d\n" b $ trinum b
    printf "%d -> %d\n" c $ trinum c
    printf "%d -> %d\n" d $ trinum d
