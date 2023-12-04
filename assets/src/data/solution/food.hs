import           Text.Printf

-- Tabby's food preferences.
main = do
    let fish = True
    let cheese = False
    printf "Tabby likes fish or cheese? %s\n" $ show $ fish || cheese
    printf "Tabby likes fish and cheese? %s\n" $ show $ fish && cheese
