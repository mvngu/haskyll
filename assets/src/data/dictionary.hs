import Text.Printf

-- A small dictionary.
main = do
    let a = "aardvark"
    let b = "armadillo"
    let c = "aardwolf"
    let d = "Aardvark"
    printf "b < a? %s\n" $ show $ b < a
    printf "c < a? %s\n" $ show $ c < a
    printf "b < c? %s\n" $ show $ b < c
    printf "a < d? %s\n" $ show $ a < d
