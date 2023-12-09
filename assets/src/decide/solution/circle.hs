import Text.Printf

-- | The area of a circle.
area :: Double -> Double
area x = pi * (x ** 2)

-- | The circumference of a circle.
circumference :: Double -> Double
circumference x = pi * (diameter x)

-- | The diameter of a circle.
diameter :: Double -> Double
diameter x = 2 * x

main = do
    putStrLn "Enter the radius of a circle."
    radius <- getLine
    let r = read radius :: Double
    printf "Radius: %f\n" r
    printf "Diameter: %f\n" $ diameter r
    printf "Circumference: %f\n" $ circumference r
    printf "Area: %f\n" $ area r
