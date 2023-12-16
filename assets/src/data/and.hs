import Text.Printf

-- Boolean and.
main = do
    let coffee = True
    let tea = False
    let water = True
    let beer = False
    printf "Coffee and tea? %s\n" (show (coffee && tea))
    printf "Coffee and water? %s\n" (show (coffee && water))
    printf "Tea and beer? %s\n" (show (tea && beer))
