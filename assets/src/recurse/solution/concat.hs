import Text.Printf

-- | Concatenate a list of lists.  This is the same as flattening the list.
flatten :: [[a]] -> [a]
flatten []     = []
flatten (x:xs) = x ++ flatten xs

main = do
    let a = [] :: [[Integer]]
    let b = [[1, 2, 3]]
    let c = [[1 .. 5], [2,4 .. 10], [3,5 .. 9]]
    let d = ["abc", "def", "g"]
    let e = [[True, False], [False, False], [True, True]] :: [[Bool]]
    printf "%s -> %s\n" (show $ flatten a) $ show $ flatten a == concat a
    printf "%s -> %s\n" (show $ flatten b) $ show $ flatten b == concat b
    printf "%s -> %s\n" (show $ flatten c) $ show $ flatten c == concat c
    printf "%s -> %s\n" (show $ flatten d) $ show $ flatten d == concat d
    printf "%s -> %s\n" (show $ flatten e) $ show $ flatten e == concat e
