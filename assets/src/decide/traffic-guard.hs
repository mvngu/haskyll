import Text.Printf

-- Meaning of each traffic light.
trafficg :: String -> String
trafficg light
    | light == "red" = "stop"
    | light == "orange" = "wait"
    | light == "green" = "go"
    | otherwise = "Invalid traffic light"

main = do
    let a = "red"
    let b = "orange"
    let c = "green"
    let d = "purple"
    printf "%s -> %s\n" a $ trafficg a
    printf "%s -> %s\n" b $ trafficg b
    printf "%s -> %s\n" c $ trafficg c
    printf "%s -> %s\n" d $ trafficg d
