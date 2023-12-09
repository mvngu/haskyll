import Text.Printf

-- | The cup size corresponding to a coffee beverage.
cupSize :: String -> String
cupSize drink
    | drink == "espresso" = "56--85 ml"
    | drink == "cappuccino" = "142--170 ml"
    | drink == "latte" = "227--426 ml"
    | drink == "frappuccino" = "312--426 ml"
    | otherwise = "unknown drink"

main = do
    putStrLn "Enter a coffee drink."
    drink <- getLine
    printf "%s -> %s\n" drink $ cupSize drink
