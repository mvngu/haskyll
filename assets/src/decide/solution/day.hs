import Text.Printf

-- A saying for each day of the week.
main = do
    putStrLn "Enter a day of the week."
    day <- getLine
    if day == "Monday"
        then do
            putStrLn "It's a weekday"
            putStrLn "A case of the Mondays"
        else if day == "Tuesday"
                 then do
                     putStrLn "It's a weekday"
                     putStrLn "Taco night"
                 else if day == "Wednesday"
                          then do
                              putStrLn "It's a weekday"
                              putStrLn "It's Wednesday, my dude"
                              putStrLn "WTF"
                          else if day == "Thursday"
                                   then do
                                       putStrLn "It's a weekday"
                                       putStrLn "Hang in there. One more day."
                                       putStrLn "WTF"
                                   else if day == "Friday"
                                            then do
                                                putStrLn "It's a weekday"
                                                putStrLn "Thank Gwynevere it's Friday"
                                                putStrLn "WTF"
                                            else if day == "Saturday"
                                                     then do
                                                         putStrLn "Weekend fun"
                                                         putStrLn "Caturday :3"
                                                     else if day == "Sunday"
                                                              then do
                                                                  putStrLn "Weekend fun"
                                                                  putStrLn "Sunday driver"
                                                              else putStrLn "Not a day of the week"
