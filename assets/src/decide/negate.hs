import Text.Printf

-- | Reverse the sign of an integer.
negateInt :: Integer -> Integer
negateInt x = -1 * x

main = do
    let k = -23
    let m = 0
    let n = 42
    printf "%d -> %d\n" k $ negateInt k
    printf "%d -> %d\n" m $ negateInt m
    printf "%d -> %d\n" n $ negateInt n
