import Text.Printf

-- | Whether a word is a palindrome.
palindrome :: String -> Bool
palindrome [] = False
palindrome [_] = True
palindrome [x, y] = x == y
palindrome (x:xs)
    | x /= last xs = False
    | otherwise = palindrome $ init xs

main = do
    let a = []
    let b = "a"
    let c = "aa"
    let d = "civic"
    let e = "racecar"
    let f = "racecars"
    let g = "rotator"
    let h = "rotor"
    let i = "rotate"
    let j = "ab"
    let testb = palindrome b == (b == reverse b)
    let testc = palindrome c == (c == reverse c)
    let testd = palindrome d == (d == reverse d)
    let teste = palindrome e == (e == reverse e)
    let testf = palindrome f == (f == reverse f)
    let testg = palindrome g == (g == reverse g)
    let testh = palindrome h == (h == reverse h)
    let testi = palindrome i == (i == reverse i)
    let testj = palindrome j == (j == reverse j)
    printf "[] -> %s: True\n" (show $ palindrome a)
    printf "%s -> %s: %s\n" b (show $ palindrome b) $ show testb
    printf "%s -> %s: %s\n" c (show $ palindrome c) $ show testc
    printf "%s -> %s: %s\n" d (show $ palindrome d) $ show testd
    printf "%s -> %s: %s\n" e (show $ palindrome e) $ show teste
    printf "%s -> %s: %s\n" f (show $ palindrome f) $ show testf
    printf "%s -> %s: %s\n" g (show $ palindrome g) $ show testg
    printf "%s -> %s: %s\n" h (show $ palindrome h) $ show testh
    printf "%s -> %s: %s\n" i (show $ palindrome i) $ show testi
    printf "%s -> %s: %s\n" j (show $ palindrome j) $ show testj
