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

-- | Sum of all positive integers from 1 to n, inclusive.
add :: Integral a => a -> a
add n
    | n > 0 = sum [x | x <- [1 .. n]]
    | otherwise = error "Must be positive integer"

-- | Sum a list of consecutive integers.
main = do
    let a = 3 :: Integer
    let b = 6 :: Integer
    let c = 11 :: Integer
    let test1 = sum [1 .. a] == add a
    let test2 = sum [1 .. b] == add b
    let test3 = sum [1 .. c] == add c
    printf "%d -> %d, check: %s\n" a (add a) $ show test1
    printf "%d -> %d, check: %s\n" b (add b) $ show test2
    printf "%d -> %d, check: %s\n" c (add c) $ show test3
