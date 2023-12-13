import Text.Printf

-- | Addition for integer vectors of three elements.
vadd :: (Integral a) => (a, a, a) -> (a, a, a) -> (a, a, a)
vadd (s, t, u) (x, y, z) = (s + x, t + y, u + z)

main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let c = 3 :: Integer
    let d = 4 :: Integer
    let s = 5 :: Int
    let t = 6 :: Int
    let u = 7 :: Int
    let v = 8 :: Int
    printf "(%d, %d, %d) + (%d, %d, %d) -> %s\n" a b c d (-b) (-d) $
        show $ vadd (a, b, c) (d, -b, -d)
    printf "(%d, %d, %d) + (%d, %d, %d) -> %s\n" s t (-t) (-v) u v $
        show $ vadd (s, t, -t) (-v, u, v)
