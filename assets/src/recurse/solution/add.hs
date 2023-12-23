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

-- | Recursive definition of addition of non-negative integers.
add :: Integral a => a -> a -> a
add 0 0 = 0
add 0 k = k
add n 0 = n
add n k
    | n < 0 || k < 0 = error "Must be non-negative integer"
    | otherwise = add (n + 1) (k - 1)

-- | Addition as successive adding of 1.
main = do
    let a = 0 :: Integer
    let b = 2 :: Integer
    let c = 1 :: Integer
    let d = 12 :: Integer
    printf "%d + %d -> %d\n" a a $ add a a
    printf "%d + %d -> %d\n" a b $ add a b
    printf "%d + %d -> %d\n" b a $ add b a
    printf "%d + %d -> %d\n" b c $ add b c
    printf "%d + %d -> %d\n" b d $ add b d
