import Text.Printf

-- | Solve the quadratic equation.
quadratic :: Double -> Double -> Double -> String
quadratic a b c = do
    let delta = (b ** 2) - (4 * a * c)
    if a == 0
        then "a is zero"
        else if delta < 0
                 then "No real roots"
                 else show $ ((-b) + (sqrt delta)) / (2 * a)

main = do
    let a = 1 / 2 :: Double -- Two real roots.
    let b = -(5 / 2) :: Double
    let c = 2 :: Double
    -- Two complex roots.
    let aa = 5 :: Double
    let bb = 20 :: Double
    let cc = 32 :: Double
    -- a is zero
    let aaa = 0 :: Double
    let bbb = 1 :: Double
    let ccc = 2 :: Double
    printf "Solution: %s\n" $ quadratic a b c
    printf "Solution: %s\n" $ quadratic aa bb cc
    printf "Solution: %s\n" $ quadratic aaa bbb ccc
