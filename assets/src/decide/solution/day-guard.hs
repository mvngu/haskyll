import Text.Printf

-- | A saying for each day of the week.
saying :: String -> String
saying day
    | day == "Monday" = "It's a weekday\nA case of the Mondays"
    | day == "Tuesday" = "It's a weekday\nTaco night"
    | day == "Wednesday" = "It's a weekday\nIt's Wednesday, my dude\nWTF"
    | day == "Thursday" = "It's a weekday\nHang in there. One more day.\nWTF"
    | day == "Friday" = "It's a weekday\nThank Gwynevere it's Friday\nWTF"
    | day == "Saturday" = "Weekend fun\nCaturday :3"
    | day == "Sunday" = "Weekend fun\nSunday driver"
    | otherwise = "Not a day of the week"

main = do
    putStrLn "Enter a day of the week."
    day <- getLine
    putStrLn $ saying day
