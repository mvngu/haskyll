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

-- | Summing a list of numbers.
add :: Num a => [a] -> a
add []     = 0
add (x:xs) = x + add xs

-- | Summing a list of numbers.  Use the fold operation.
addf :: Num a => [a] -> a
addf xs = foldl (+) 0 xs

-- | Add together all numbers in a list.
main = do
    let a = [] :: [Int]
    let b = [1, 2, 3] :: [Integer]
    let c = [3, 5, 7, 11, 13] :: [Float]
    let d = [1,4 .. 100] :: [Double]
    let testa = sum a == add a && sum a == addf a
    let testb = sum b == add b && sum b == addf b
    let testc = sum c == add c && sum c == addf c
    let testd = sum d == add d && sum d == addf d
    printf "%s: %s\n" (show $ add a) $ show testa
    printf "%s: %s\n" (show $ add b) $ show testb
    printf "%s: %s\n" (show $ add c) $ show testc
    printf "%s: %s\n" (show $ add d) $ show testd
