--------------------------------------------------------------------------------
-- MIT License
--
-- Copyright (C) 2024 Duck McSouls <quacksouls [AT] gmail [DOT] com>
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

-- | An implementation of the function "and" without using the operator "&&".
-- Boolean "and" is also known as conjunction.
conj :: [Bool] -> Bool
conj []         = True
conj [x]        = x
conj (False:xs) = False
conj (True:xs)  = conj xs

-- | An implementation of the function "and" without using the operator "&&".
main = do
    let a = []
    let b = [True]
    let c = [False]
    let d = b ++ c
    let e = c ++ d
    let f = b ++ b ++ c
    let g = [even x | x <- [1 .. 10]]
    let h = [even x | x <- [2,4 .. 10]]
    let i = [even x | x <- [1,3 .. 10]]
    let testa = conj a == and a
    let testb = conj b == and b
    let testc = conj c == and c
    let testd = conj d == and d
    let teste = conj e == and e
    let testf = conj f == and f
    let testg = conj g == and g
    let testh = conj h == and h
    let testi = conj i == and i
    printf "[] -> %s, %s\n" (show . conj $ a) $ show testa
    printf "%s -> %s, %s\n" (show b) (show . conj $ b) $ show testb
    printf "%s -> %s, %s\n" (show c) (show . conj $ c) $ show testc
    printf "%s -> %s, %s\n" (show d) (show . conj $ d) $ show testd
    printf "%s -> %s, %s\n" (show e) (show . conj $ e) $ show teste
    printf "%s -> %s, %s\n" (show f) (show . conj $ f) $ show testf
    printf "%s -> %s, %s\n" (show g) (show . conj $ g) $ show testg
    printf "%s -> %s, %s\n" (show h) (show . conj $ h) $ show testh
    printf "%s -> %s, %s\n" (show i) (show . conj $ i) $ show testi
