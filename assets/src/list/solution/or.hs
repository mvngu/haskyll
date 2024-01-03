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

-- | An implementation of the function "or" without using the operator "||".
-- Boolean "or" is also known as disjunction.
disj :: [Bool] -> Bool
disj []         = False
disj [x]        = x
disj (False:xs) = disj xs
disj (True:xs)  = True

-- | An implementation of the function "or" without using the operator "||".
main = do
    let a = []
    let b = [True]
    let c = [False]
    let cc = c ++ c ++ c
    let d = b ++ c
    let e = c ++ d
    let f = b ++ b ++ c
    let g = [even x | x <- [1 .. 10]]
    let h = [even x | x <- [2,4 .. 10]]
    let i = [even x | x <- [1,3 .. 10]]
    let testa = disj a == or a
    let testb = disj b == or b
    let testc = disj c == or c
    let testcc = disj cc == or cc
    let testd = disj d == or d
    let teste = disj e == or e
    let testf = disj f == or f
    let testg = disj g == or g
    let testh = disj h == or h
    let testi = disj i == or i
    printf "[] -> %s, %s\n" (show . disj $ a) $ show testa
    printf "%s -> %s, %s\n" (show b) (show . disj $ b) $ show testb
    printf "%s -> %s, %s\n" (show c) (show . disj $ c) $ show testc
    printf "%s -> %s, %s\n" (show cc) (show . disj $ cc) $ show testcc
    printf "%s -> %s, %s\n" (show d) (show . disj $ d) $ show testd
    printf "%s -> %s, %s\n" (show e) (show . disj $ e) $ show teste
    printf "%s -> %s, %s\n" (show f) (show . disj $ f) $ show testf
    printf "%s -> %s, %s\n" (show g) (show . disj $ g) $ show testg
    printf "%s -> %s, %s\n" (show h) (show . disj $ h) $ show testh
    printf "%s -> %s, %s\n" (show i) (show . disj $ i) $ show testi
