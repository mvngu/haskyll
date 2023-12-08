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

main
    -- Two real roots.
 = do
    let a = 1 / 2 :: Double
    let b = -(5 / 2) :: Double
    let c = 2 :: Double
    --
    -- Two complex roots.
    -- let a = 5 :: Double
    -- let b = 20 :: Double
    -- let c = 32 :: Double
    --
    -- a is zero
    -- let a = 0 :: Double
    -- let b = 1 :: Double
    -- let c = 2 :: Double
    printf "Solution: %s\n" $ quadratic a b c
