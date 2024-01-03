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

-- | Whether an integer is positive.
isPositive :: Int -> Bool
isPositive n = n > 0

-- | An implementation of the function "any" without using the operator "||".
some :: (a -> Bool) -> [a] -> Bool
some _ [] = False
some f (x:xs)
    | f x == True = True
    | otherwise = some f xs

-- | An implementation of the function "any" without using the operator "||".
main = do
    let a = []
    let b = [-19, -1, -5, -6, 1, -7, -3, -8, -15, -4, -11, -17, -10]
    let c = [2, -1, -18, -14, -2, -15, -11, -20, -15, -11, 0, -4, -14]
    let d = [-4, -3, -3, -1, -8, -4, -7, -19, -14, 0, -15, -1, -7]
    let e = ["benign", "elixir", "tumid", "intemperance", "narcissist"]
    let anya = some isPositive a
    let anyb = some isPositive b
    let anyc = some isPositive c
    let anyd = some isPositive d
    let anye = some (\str -> length str <= 5) e
    let anyee = some (\str -> length str >= 8) e
    let testa = anya == any isPositive a
    let testb = anyb == any isPositive b
    let testc = anyc == any isPositive c
    let testd = anyd == any isPositive d
    let teste = anye == any (\str -> length str <= 5) e
    let testee = anyee == any (\str -> length str >= 8) e
    printf "[] -> any positive? %s, %s\n" (show anya) $ show testa
    printf "%s -> any positive? %s, %s\n" (show b) (show anyb) $ show testb
    printf "%s -> any positive? %s, %s\n" (show c) (show anyc) $ show testc
    printf "%s -> any positive? %s, %s\n" (show d) (show anyd) $ show testd
    printf "%s -> any length <= 5? %s, %s\n" (show e) (show anye) $ show teste
    printf "%s -> any length >= 8? %s, %s\n" (show e) (show anyee) $ show testee
