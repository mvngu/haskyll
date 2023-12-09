import Text.Printf

-- | The signum function.
sgn :: Double -> Integer
sgn x
    | x < 0 = -1 :: Integer
    | x == 0 = 0 :: Integer
    | x > 0 = 1 :: Integer

main = do
    let a = -5
    let b = 0
    let c = 42
    printf "%f -> %d\n" a $ sgn a
    printf "%f -> %d\n" b $ sgn b
    printf "%f -> %d\n" c $ sgn c
