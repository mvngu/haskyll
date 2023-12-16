import Text.Printf

-- Boolean or.
main = do
    let coffee = True
    let tea = False
    let water = True
    let beer = False
    printf "Coffee or tea? %s\n" $ show (coffee || tea)
    printf "Tea or water? %s\n" $ show (tea || water)
    printf "Tea or beer? %s\n" $ show (tea || beer)
