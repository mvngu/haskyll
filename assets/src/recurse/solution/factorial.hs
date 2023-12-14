import Text.Printf

-- | The factorial of a non-negative integer.
fact :: Integer -> Integer
fact 0 = 1
fact 1 = 1
fact n
    | n > 1 = n * (fact $ n - 1)
    | otherwise = error "Must be non-negative integer"

main = do
    let a = 1
    let b = 5
    let c = 10
    let d = 20
    let test1 = (product [1 .. a]) == (fact a)
    let test2 = (product [1 .. b]) == (fact b)
    let test3 = (product [1 .. c]) == (fact c)
    let test4 = (product [1 .. d]) == (fact d)
    printf "%d -> %d, check: %s\n" a (fact a) $ show test1
    printf "%d -> %d, check: %s\n" b (fact b) $ show test2
    printf "%d -> %d, check: %s\n" c (fact c) $ show test3
    printf "%d -> %d, check: %s\n" d (fact d) $ show test4
