import Text.Printf

-- | Binet's formula for the n-th Fibonacci number.
binet :: Integer -> Integer
binet n = do
    let k = fromIntegral n :: Double
    let phi = (1.0 + sqrt 5) / 2.0 :: Double
    let psi = (1.0 - sqrt 5) / 2.0 :: Double
    floor $ ((phi ** k) - (psi ** k)) / (sqrt 5)

-- | The Fibonacci numbers.
fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n
    | n > 1 = (fib $ n - 1) + (fib $ n - 2)
    | otherwise = error "Must be non-negative integer"

main = do
    let a = 0 :: Integer
    let b = 1 :: Integer
    let c = 2 :: Integer
    let d = 3 :: Integer
    let e = 4 :: Integer
    let f = 5 :: Integer
    let g = 6 :: Integer
    let h = 7 :: Integer
    let i = 8 :: Integer
    let j = 9 :: Integer
    let k = 10 :: Integer
    printf "%d -> %d: %s\n" a (fib a) $ show $ fib a == binet a
    printf "%d -> %d: %s\n" b (fib b) $ show $ fib b == binet b
    printf "%d -> %d: %s\n" c (fib c) $ show $ fib c == binet c
    printf "%d -> %d: %s\n" d (fib d) $ show $ fib d == binet d
    printf "%d -> %d: %s\n" e (fib e) $ show $ fib e == binet e
    printf "%d -> %d: %s\n" f (fib f) $ show $ fib f == binet f
    printf "%d -> %d: %s\n" g (fib g) $ show $ fib g == binet g
    printf "%d -> %d: %s\n" h (fib h) $ show $ fib h == binet h
    printf "%d -> %d: %s\n" i (fib i) $ show $ fib i == binet i
    printf "%d -> %d: %s\n" j (fib j) $ show $ fib j == binet j
    printf "%d -> %d: %s\n" k (fib k) $ show $ fib k == binet k
