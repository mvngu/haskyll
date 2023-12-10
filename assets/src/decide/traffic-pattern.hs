import Text.Printf

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
    printf "%s -> %s\n" a $ trafficp a
    printf "%s -> %s\n" b $ trafficp b
    printf "%s -> %s\n" c $ trafficp c
    printf "%s -> %s\n" d $ trafficp d
