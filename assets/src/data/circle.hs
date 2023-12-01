-- Calculate the area of a circle.
main = do
    putStrLn "Please enter the radius."
    radius <- getLine
    let r = (read radius :: Double)
    let area = pi * (r ** 2)
    putStrLn ("Area of circle: " ++ show area)
