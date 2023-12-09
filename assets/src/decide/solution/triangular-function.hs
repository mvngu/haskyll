import Text.Printf

-- | The absolute value function.
absolute :: Double -> Double
absolute x
    | x >= 0 = x
    | otherwise = -x

-- | The triangular function.
tri :: Double -> Double
tri x
    | absolute x < 1 = 1 - (absolute x)
    | otherwise = 0

main = do
    let a = -1.5
    let b = -1
    let c = -0.5
    let d = 0
    let e = 0.5
    let f = 1
    let g = 1.5
    printf "%f -> %f\n" a $ tri a
    printf "%f -> %f\n" b $ tri b
    printf "%f -> %f\n" c $ tri c
    printf "%f -> %f\n" d $ tri d
    printf "%f -> %f\n" e $ tri e
    printf "%f -> %f\n" f $ tri f
    printf "%f -> %f\n" g $ tri g
