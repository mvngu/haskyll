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

-- | The product of two positive integers.
mult :: Integral a => a -> a -> a
mult 0 _ = 0
mult _ 0 = 0
mult k 1 = k
mult k n
    | k < 0 || n < 0 = error "Must be positive integer"
    | otherwise = k + mult k (n - 1)

-- | Integer multiplication as recursion.
main = do
    let a = 2 :: Integer
    let b = 3 :: Integer
    let c = 12 :: Integer
    let d = 13 :: Integer
    let e = 1 :: Integer
    let z = 0 :: Integer
    printf "%d x %d = %d: %s\n" a b (mult a b) $ show $ mult a b == a * b
    printf "%d x %d = %d: %s\n" a c (mult a c) $ show $ mult a c == a * c
    printf "%d x %d = %d: %s\n" d c (mult d c) $ show $ mult d c == d * c
    printf "%d x %d = %d: %s\n" d e (mult d e) $ show $ mult d e == d * e
    printf "%d x %d = %d: %s\n" z c (mult z c) $ show $ mult z c == z * c
    printf "%d x %d = %d: %s\n" a z (mult a z) $ show $ mult a z == a * z
    printf "%d x %d = %d: %s\n" z z (mult z z) $ show $ mult z z == z * z
