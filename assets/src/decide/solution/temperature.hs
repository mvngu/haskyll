import Text.Printf

-- | Convert a temperature value from Fahrenheit to Celsius.
toCelsius :: Double -> Double
toCelsius x = (x - 32.0) / 1.8

-- | Convert a temperature value from Celsius to Fahrenheit.
toFahrenheit :: Double -> Double
toFahrenheit x = (x * 1.8) + 32.0

main = do
    let c = 37 :: Double
    let f = 212 :: Double
    printf "%f Celsius -> %f Fahrenheit\n" c $ toFahrenheit c
    printf "%f Fahrenheit -> %f Celsius\n" f $ toCelsius f
