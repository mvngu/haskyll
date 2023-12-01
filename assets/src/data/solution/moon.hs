-- Calculate a person's weight on the Moon.
main = do
    putStrLn "Enter your weight in pounds."
    pound <- getLine
    let lb = (read pound :: Double)
    let kg = lb * 0.45359237
    putStrLn "Your weight on the Moon."
    putStrLn ("In pounds: " ++ show (0.166 * lb))
    putStrLn ("In kilograms: " ++ show (0.166 * kg))
