--------------------------------------------------------------------------------
-- MIT License
--
-- Copyright (C) 2023 Duck McSouls <quacksouls [AT] gmail [DOT] com>
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--------------------------------------------------------------------------------

import Text.Printf

-- | Whether a word is a palindrome.
palindrome :: String -> Bool
palindrome [] = False
palindrome [_] = True
palindrome [x, y] = x == y
palindrome (x:xs)
    | x /= last xs = False
    | otherwise = palindrome $ init xs

-- | Testing for palindrome.
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
