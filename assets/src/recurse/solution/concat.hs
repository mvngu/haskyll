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

-- | Concatenate a list of lists.  This is the same as flattening the list.
flatten :: [[a]] -> [a]
flatten []     = []
flatten (x:xs) = x ++ flatten xs

-- | List concatenation.
main = do
    let a = [] :: [[Integer]]
    let b = [[1, 2, 3]]
    let c = [[1 .. 5], [2,4 .. 10], [3,5 .. 9]]
    let d = ["abc", "def", "g"]
    let e = [[True, False], [False, False], [True, True]] :: [[Bool]]
    printf "%s -> %s\n" (show $ flatten a) $ show $ flatten a == concat a
    printf "%s -> %s\n" (show $ flatten b) $ show $ flatten b == concat b
    printf "%s -> %s\n" (show $ flatten c) $ show $ flatten c == concat c
    printf "%s -> %s\n" (show $ flatten d) $ show $ flatten d == concat d
    printf "%s -> %s\n" (show $ flatten e) $ show $ flatten e == concat e
