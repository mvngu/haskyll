import Text.Printf

-- | Remove the first element if it is odd.
dropOdd :: (Integral a) => [a] -> [a]
dropOdd [] = error "Empty list"
dropOdd (x:xs)
    | (mod x 2) == 0 = [x] ++ xs
    | otherwise = xs

main = do
    let a = [1]
    let b = [2, 3]
    let c = [3, 4, 5]
    let d = [4, 6, 8]
    printf "%s -> %s\n" (show a) $ show $ dropOdd a
    printf "%s -> %s\n" (show b) $ show $ dropOdd b
    printf "%s -> %s\n" (show c) $ show $ dropOdd c
    printf "%s -> %s\n" (show d) $ show $ dropOdd d
