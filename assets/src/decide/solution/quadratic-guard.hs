import Text.Printf

-- | Solve the quadratic equation.
quadratic :: Double -> Double -> Double -> String
quadratic a b c
    | (b ** 2) - (4 * a * c) > 0 = "two distinct real solutions"
    | (b ** 2) - (4 * a * c) == 0 = "repeated real solution"
    | (b ** 2) - (4 * a * c) < 0 = "two distinct complex solutions"

main = do
    let a = 1 / 2 :: Double -- Two real roots.
    let b = -(5 / 2) :: Double
    let c = 2 :: Double
    -- Two complex roots.
    let aa = 5 :: Double
    let bb = 20 :: Double
    let cc = 32 :: Double
    -- Repeated real root.
    let aaa = 2 :: Double
    let bbb = 4 :: Double
    let ccc = 2 :: Double
    printf "%s\n" $ quadratic a b c
    printf "%s\n" $ quadratic aa bb cc
    printf "%s\n" $ quadratic aaa bbb ccc
