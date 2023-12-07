import Text.Printf

-- Todo lists for the weekend.
main = do
    putStrLn "Enter a day."
    day <- getLine
    if day == "Saturday"
        then do
            putStrLn "1. Grocery shopping"
            putStrLn "2. Stock up on sardine and tuna cans"
        else if day == "Sunday"
                 then do
                     putStrLn "1. Load the washing machine"
                     putStrLn "2. Comb and brush Tabby"
                     putStrLn "3. Hang the clothes out to dry"
                 else putStrLn "Not the weekend"
