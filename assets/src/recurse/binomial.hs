import Text.Printf

-- | The binomial coefficients in terms of factorial.
binomA :: Integer -> Integer -> Integer
binomA n 0 = 1
binomA 0 k = 0
binomA n k
    | n < 0 = error "Must be non-negative integer"
    | (k > n) || (k < 0) = 0
    | otherwise = do
        let a = product [1 .. n]
        let b = product [1 .. k]
        let c = product [1 .. (n - k)]
        a `div` (b * c)

-- | Recursive formulation of the binomial coefficients.
binomB :: Integer -> Integer -> Integer
binomB n 0 = 1
binomB 0 k = 0
binomB n k
    | n < 0 = error "Must be non-negative integer"
    | (k > n) || (k < 0) = 0
    | otherwise = (n * binomB (n - 1) (k - 1)) `div` k

main = do
    let an = 0 :: Integer
    let ak = 5 :: Integer
    let bn = 10 :: Integer
    let bk = 0 :: Integer
    let cn = 10 :: Integer
    let ck = 7 :: Integer
    let dn = 17 :: Integer
    let dk = 9 :: Integer
    printf "%d, %d -> %d: %s\n" an ak (binomB an ak) $ show $ (binomA an ak) == (binomB an ak)
    printf "%d, %d -> %d: %s\n" bn bk (binomB bn bk) $ show $ (binomA bn bk) == (binomB bn bk)
    printf "%d, %d -> %d: %s\n" cn ck (binomB cn ck) $ show $ (binomA cn ck) == (binomB cn ck)
    printf "%d, %d -> %d: %s\n" dn dk (binomB dn dk) $ show $ (binomA dn dk) == (binomB dn dk)
