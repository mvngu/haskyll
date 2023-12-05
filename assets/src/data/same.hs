import           Text.Printf

-- Same or different?
main = do
    let a = 42
    let b = "42"
    printf "a == b? %s\n" $ show $ a == b
