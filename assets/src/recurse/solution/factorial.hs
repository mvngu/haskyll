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

-- | The factorial of a non-negative integer.  Early version.
factorialA :: Integer -> Integer
factorialA 0 = 1
factorialA 1 = 1
factorialA n
    | n > 1 = n * (factorialA $ n - 1)
    | otherwise = error "Must be non-negative integer"

-- | The factorial of a non-negative integer.  Improved version.
factorialB :: Integer -> Integer
factorialB 0 = 1
factorialB n
    | n > 0 = n * (factorialB $ n - 1)
    | otherwise = error "Must be non-negative integer"

-- | The factorial of a non-negative integer.  Better version.
factorialC :: Integer -> Integer
factorialC n
    | n < 0 = error "Must be non-negative integer"
    | otherwise = product [1 .. n]

-- | The factorial of a non-negative integer.  Use a fold operation.
factorialD :: Integer -> Integer
factorialD n
    | n < 0 = error "Must be non-negative integer"
    | otherwise = foldl (*) 1 [1 .. n]

-- | Various implementations of factorial.
main = do
    let a = 1
    let b = 5
    let c = 10
    let d = 20
    let e = 0
    let pa = product [1 .. a]
    let pb = product [1 .. b]
    let pc = product [1 .. c]
    let pd = product [1 .. d]
    let pe = product [1 .. e]
    let testa = and [pa == factorialA a, pa == factorialB a, pa == factorialC a, pa == factorialD a]
    let testb = and [pb == factorialA b, pb == factorialB b, pb == factorialC b, pb == factorialD b]
    let testc = and [pc == factorialA c, pc == factorialB c, pc == factorialC c, pc == factorialD c]
    let testd = and [pd == factorialA d, pd == factorialB d, pd == factorialC d, pd == factorialD d]
    let teste = and [pe == factorialA e, pe == factorialB e, pe == factorialC e, pe == factorialD e]
    printf "%d -> %d, check: %s\n" a (factorialA a) $ show testa
    printf "%d -> %d, check: %s\n" b (factorialA b) $ show testb
    printf "%d -> %d, check: %s\n" c (factorialA c) $ show testc
    printf "%d -> %d, check: %s\n" d (factorialA d) $ show testd
    printf "%d -> %d, check: %s\n" e (factorialA e) $ show teste
