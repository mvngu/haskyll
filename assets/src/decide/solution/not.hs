import Text.Printf

-- | Reimplementation of the library function "not".
myNot :: Bool -> Bool
myNot False = True
myNot _     = False

main = do
    let test1 = (not True) == (myNot True)
    let test2 = (not False) == (myNot False)
    printf "%s -> %s, check: %s\n" (show True) (show $ myNot True) $ show test1
    printf "%s -> %s, check: %s\n" (show False) (show $ myNot False) $ show test2
