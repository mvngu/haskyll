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

-- | The binomial coefficients in terms of factorial.
binomA :: Integer -> Integer -> Integer
binomA n 0 = 1
binomA 0 k = 0
binomA n k
    | n < 0 = error "Must be non-negative integer"
    | (k > n) || (k < 0) = 0
    | n == k = 1
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
    | n == k = 1
    | otherwise = (n * binomB (n - 1) (k - 1)) `div` k

-- | The binomial coefficients as Pascal's triangle.
binomC :: Integer -> Integer -> Integer
binomC n 0 = 1
binomC 0 k = 0
binomC n k
    | n < 0 = error "Must be non-negative integer"
    | (k > n) || (k < 0) = 0
    | n == k = 1
    | otherwise = (binomC (n - 1) k) + (binomC (n - 1) (k - 1))

-- | Various implementations of the binomial coefficients.
main = do
    let an = 0 :: Integer
    let ak = 5 :: Integer
    let bn = 10 :: Integer
    let bk = 0 :: Integer
    let cn = 10 :: Integer
    let ck = 7 :: Integer
    let dn = 17 :: Integer
    let dk = 9 :: Integer
    let test1 = (binomA an ak) == (binomB an ak) && (binomB an ak) == (binomC an ak)
    let test2 = (binomA bn bk) == (binomB bn bk) && (binomB bn bk) == (binomC bn bk)
    let test3 = (binomA cn ck) == (binomB cn ck) && (binomB cn ck) == (binomC cn ck)
    let test4 = (binomA dn dk) == (binomB dn dk) && (binomB dn dk) == (binomC dn dk)
    printf "%d, %d -> %d: %s\n" an ak (binomB an ak) $ show test1
    printf "%d, %d -> %d: %s\n" bn bk (binomB bn bk) $ show test2
    printf "%d, %d -> %d: %s\n" cn ck (binomB cn ck) $ show test3
    printf "%d, %d -> %d: %s\n" dn dk (binomB dn dk) $ show test4
