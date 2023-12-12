import Text.Printf

-- | Reimplementation of the boolean operator "&&".
myAnd :: Bool -> Bool -> Bool
myAnd True True = True
myAnd _ _       = False

main = do
    let test1 = (True && True) == (myAnd True True)
    let test2 = (True && False) == (myAnd True False)
    let test3 = (False && True) == (myAnd False True)
    let test4 = (False && False) == (myAnd False False)
    printf "%s and %s, check: %s\n" (show True) (show True) (show test1)
    printf "%s and %s, check: %s\n" (show True) (show False) (show test2)
    printf "%s and %s, check: %s\n" (show False) (show True) (show test3)
    printf "%s and %s, check: %s\n" (show False) (show False) (show test4)
