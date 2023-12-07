import Text.Printf

-- Is it weekend yet?
main = do
    putStrLn "Enter a day of the week."
    day <- getLine
    let period =
            if (day == "Saturday") || (day == "Sunday")
                then "weekend"
                else "weekday"
    printf "%s is a %s\n" day period
