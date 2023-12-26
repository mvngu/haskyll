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

-- | Reverse a list via a fold.
rvrs :: [a] -> [a]
rvrs [] = []
rvrs xs = foldl (\acc x -> x : acc) [] xs

-- | Reverse a list.
main = do
    let a = [1]
    let b = [1, 2, 3]
    let c = "abc"
    let d = "radar"
    let e = []
    let testa = reverse a == rvrs a
    let testb = reverse b == rvrs b
    let testc = reverse c == rvrs c
    let testd = reverse d == rvrs d
    printf "%s -> %s: %s\n" (show a) (show $ rvrs a) $ show testa
    printf "%s -> %s: %s\n" (show b) (show $ rvrs b) $ show testb
    printf "%s -> %s: %s\n" (show c) (show $ rvrs c) $ show testc
    printf "%s -> %s: %s\n" (show d) (show $ rvrs d) $ show testd
