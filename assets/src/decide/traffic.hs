import Text.Printf

-- Meaning of each traffic light.
trafficg :: String -> String
trafficg light
    | light == "red" = "stop"
    | light == "orange" = "wait"
    | light == "green" = "go"
    | otherwise = "Invalid traffic light"

-- Meaning of each traffic light.
trafficp :: String -> String
trafficp "red"    = "stop"
trafficp "orange" = "wait"
trafficp "green"  = "go"
trafficp _        = "Invalid traffic light"

main = do
    let a = "red"
    let b = "orange"
    let c = "green"
    let d = "purple"
    -- Guarded equation.
    printf "%s -> %s\n" a $ trafficg a
    printf "%s -> %s\n" b $ trafficg b
    printf "%s -> %s\n" c $ trafficg c
    printf "%s -> %s\n" d $ trafficg d
    -- Pattern matching.
    printf "%s -> %s\n" a $ trafficp a
    printf "%s -> %s\n" b $ trafficp b
    printf "%s -> %s\n" c $ trafficp c
    printf "%s -> %s\n" d $ trafficp d
