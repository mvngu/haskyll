import Text.Printf

-- | The body mass index (BMI).  Weight is in kilograms and height is
-- in metres.
bmi :: Double -> Double -> Double
bmi weight height = weight / (height ** 2)

-- | The weight status of an adult 20 years or older, based on their BMI.
weightStatus :: Double -> String
weightStatus bm
    | bm < 18.5 = "underweight"
    | (18.5 <= bm) && (bm <= 24.9) = "healthy weight"
    | (25.0 <= bm) && (bm <= 29.9) = "overweight"
    | bm >= 30.0 = "obese"
    | otherwise = "unknown BMI or weight status"

main = do
    putStrLn "Enter your weight in kilograms."
    weight <- getLine
    putStrLn "Enter your height in metres."
    height <- getLine
    let w = read weight :: Double
    let h = read height :: Double
    printf "Your BMI: %f\n" $ bmi w h
    printf "Weight status: %s\n" $ weightStatus $ bmi w h
