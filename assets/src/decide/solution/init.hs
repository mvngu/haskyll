import Text.Printf

-- | An implementation of the function "init".
myInit :: [a] -> [a]
myInit [] = error "Empty list"
myInit [x] = []
myInit (x:xs) = do
    let (left, _) = splitAt ((length xs) - 1) xs
    [x] ++ left

main = do
    let a = [2]
    let b = [1, 2]
    let c = [3, 4, 5]
    let test1 = (init a) == (myInit a)
    let test2 = (init b) == (myInit b)
    let test3 = (init c) == (myInit c)
    printf "%s -> %s: %s\n" (show a) (show $ myInit a) $ show test1
    printf "%s -> %s: %s\n" (show b) (show $ myInit b) $ show test2
    printf "%s -> %s: %s\n" (show c) (show $ myInit c) $ show test3
