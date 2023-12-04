import           Text.Printf

-- Boolean or.
main = do
    let coffee = True
    let tea = False
    let water = True
    let beer = False
    putStrLn (printf "Coffee or tea? %s" $ show (coffee || tea))
    putStrLn (printf "Tea or water? %s" $ show (tea || water))
    putStrLn (printf "Tea or beer? %s" $ show (tea || beer))
