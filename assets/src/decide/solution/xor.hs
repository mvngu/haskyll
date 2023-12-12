import Data.Bits
import Text.Printf

-- | Reimplementation of the method "xor" from the package "Data.Bits".
myXor :: Bool -> Bool -> Bool
myXor True True   = False
myXor False False = False
myXor _ _         = True

main = do
    let test1 = (xor True True) == (myXor True True)
    let test2 = (xor True False) == (myXor True False)
    let test3 = (xor False True) == (myXor False True)
    let test4 = (xor False False) == (myXor False False)
    printf "%s xor %s, check: %s\n" (show True) (show True) (show test1)
    printf "%s xor %s, check: %s\n" (show True) (show False) (show test2)
    printf "%s xor %s, check: %s\n" (show False) (show True) (show test3)
    printf "%s xor %s, check: %s\n" (show False) (show False) (show test4)
