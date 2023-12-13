import Text.Printf

-- | Addition for vectors of two elements.
vadd :: (Num a) => (a, a) -> (a, a) -> (a, a)
vadd (s, t) (x, y) = (s + x, t + y)

main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let c = 3 :: Integer
    let d = 4 :: Integer
    let s = 1.2 :: Double
    let t = 3.4 :: Double
    let u = 5.6 :: Double
    let v = 7.8 :: Double
    printf "(%d, %d) + (%d, %d) -> %s\n" a b c d $ show $ vadd (a, b) (c, d)
    printf "(%f, %f) + (%f, %f) -> %s\n" s t u v $ show $ vadd (s, t) (u, v)
