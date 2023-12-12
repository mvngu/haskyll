import Text.Printf

-- | Reimplementation of the boolean operator "||".
myOr :: Bool -> Bool -> Bool
myOr False False = False
myOr False True  = True
myOr True _      = True

main = do
    let test1 = (True || True) == (myOr True True)
    let test2 = (True || False) == (myOr True False)
    let test3 = (False || True) == (myOr False True)
    let test4 = (False || False) == (myOr False False)
    printf "%s or %s, check: %s\n" (show True) (show True) (show test1)
    printf "%s or %s, check: %s\n" (show True) (show False) (show test2)
    printf "%s or %s, check: %s\n" (show False) (show True) (show test3)
    printf "%s or %s, check: %s\n" (show False) (show False) (show test4)
