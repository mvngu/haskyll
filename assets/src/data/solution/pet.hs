import Data.Bits
import Text.Printf

-- Sam's pet preferences.
main = do
    let cat = True
    let dog = False
    printf "Sam likes cats and dogs? %s\n" $ show $ cat && dog
    printf "Sam likes cats or dogs? %s\n" $ show $ cat || dog
    printf "Sam likes cats XOR dogs? %s\n" $ show $ xor cat dog
