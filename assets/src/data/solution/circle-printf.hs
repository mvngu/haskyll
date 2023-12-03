import           Text.Printf

-- Calculate the area of a circle.
-- Use the function printf for string formatting.
main = do
    putStrLn "Please enter the radius."
    radius <- getLine
    let r = (read radius :: Double)
    let area = pi * (r ** 2)
    putStrLn (printf "Area of circle: %f" area)
