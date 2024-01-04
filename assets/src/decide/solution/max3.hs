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

-- | The maximum of three integers.
max3 :: Integer -> Integer -> Integer -> Integer
max3 a b c
    | a >= b && a >= c = a
    | b >= a && b >= c = b
    | otherwise = c

-- | Determine the greatest of three integers.
main = do
    let a = 1 :: Integer
    let b = 2 :: Integer
    let c = 3 :: Integer
    let test1 = (max a $ max b c) == max3 a b c
    let test2 = (max (-a) $ max b c) == max3 (-a) b c
    let test3 = (max a $ max (-b) c) == max3 a (-b) c
    let test4 = (max a $ max b (-c)) == max3 a b (-c)
    printf "%d, %d, %d: %d, %s\n" a b c (max3 a b c) $ show test1
    printf "%d, %d, %d: %d, %s\n" (-a) b c (max3 (-a) b c) $ show test2
    printf "%d, %d, %d: %d, %s\n" a (-b) c (max3 a (-b) c) $ show test3
    printf "%d, %d, %d: %d, %s\n" a b (-c) (max3 a b (-c)) $ show test4
