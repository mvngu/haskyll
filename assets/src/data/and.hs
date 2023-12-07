import Text.Printf

-- Boolean and.
main = do
    let coffee = True
    let tea = False
    let water = True
    let beer = False
    putStrLn (printf "Coffee and tea? %s" (show (coffee && tea)))
    putStrLn (printf "Coffee and water? %s" (show (coffee && water)))
    putStrLn (printf "Tea and beer? %s" (show (tea && beer)))
