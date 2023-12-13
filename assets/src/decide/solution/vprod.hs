import Text.Printf

-- | The dot product of vectors of two elements.
vprod :: (Num a) => (a, a) -> (a, a) -> a
vprod (s, t) (x, y) = (s * x) + (t * y)

main = do
    let a = 2 :: Double
    let b = 3 :: Double
    let x = 4 :: Double
    let y = 5 :: Double
    printf "(%f, %f) dot (%f, %f) -> %f\n" a b x y $ vprod (a, b) (x, y)
    printf "(%f, %f) dot (%f, %f) -> %f\n" (-a) b x y $ vprod (-a, b) (x, y)
    printf "(%f, %f) dot (%f, %f) -> %f\n" a b (-x) (-y) $ vprod (a, b) (-x, -y)
