import Text.Printf

-- | The length of a list.
size :: [a] -> Int
size []     = 0
size (x:xs) = 1 + size xs

main = do
    let a = []
    let b = [1, 3, 5]
    let c = ["a", "b", "c", "d", "e"]
    let d = "dandelion"
    printf "[] -> %d: %s\n" (size a) $ show $ size a == length a
    printf "%s -> %d: %s\n" (show b) (size b) $ show $ size b == length b
    printf "%s -> %d: %s\n" (show c) (size c) $ show $ size c == length c
    printf "%s -> %d: %s\n" (show d) (size d) $ show $ size d == length d
