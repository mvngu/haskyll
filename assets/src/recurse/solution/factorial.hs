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

-- | The factorial of a non-negative integer.
fact :: Integer -> Integer
fact 0 = 1
fact 1 = 1
fact n
    | n > 1 = n * (fact $ n - 1)
    | otherwise = error "Must be non-negative integer"

main = do
    let a = 1
    let b = 5
    let c = 10
    let d = 20
    let test1 = (product [1 .. a]) == (fact a)
    let test2 = (product [1 .. b]) == (fact b)
    let test3 = (product [1 .. c]) == (fact c)
    let test4 = (product [1 .. d]) == (fact d)
    printf "%d -> %d, check: %s\n" a (fact a) $ show test1
    printf "%d -> %d, check: %s\n" b (fact b) $ show test2
    printf "%d -> %d, check: %s\n" c (fact c) $ show test3
    printf "%d -> %d, check: %s\n" d (fact d) $ show test4
