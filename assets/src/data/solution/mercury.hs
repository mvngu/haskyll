-- Convert age from Earth years to Mercury years.
main = do
    putStrLn "Enter your age in years."
    year <- getLine
    let y = read year :: Double
    let earthDay = 365 * y
    let mercuryYear = round (earthDay / 88)
    putStrLn ("Your age on Mercury: " ++ show mercuryYear ++ " years")
