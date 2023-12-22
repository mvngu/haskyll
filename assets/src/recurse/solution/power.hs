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

-- | Integer exponentiation.
pow :: Integer -> Integer -> Integer
pow 0 0 = 1
pow 0 _ = 0
pow _ 0 = 1
pow a n
    | n < 0 = error "Must be positive integer"
    | otherwise = a * pow a (n - 1)

-- | Integer exponentiation.
main = do
    let a = 2 :: Integer
    let b = -7 :: Integer
    let c = 0 :: Integer
    let d = 3 :: Integer
    let test1 = pow a c == a ^ c
    let test2 = pow c c == c ^ c
    let test3 = pow c a == c ^ a
    let test4 = pow a d == a ^ d
    let test5 = pow b d == b ^ d
    printf "%d^0 -> %d: %s\n" a (pow a c) $ show test1
    printf "0^0 -> %d: %s\n" (pow c c) $ show test2
    printf "0^%d -> %d: %s\n" a (pow c a) $ show test3
    printf "%d^%d -> %d: %s\n" a d (pow a d) $ show test4
    printf "%d^%d -> %d: %s\n" b d (pow b d) $ show test5
