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

-- | Remove the first element if it is odd.
dropOdd :: (Integral a) => [a] -> [a]
dropOdd [] = error "Empty list"
dropOdd (x:xs)
    | (mod x 2) == 0 = [x] ++ xs
    | otherwise = xs

-- | Remove first integer if it is odd.
main = do
    let a = [1]
    let b = [2, 3]
    let c = [3, 4, 5]
    let d = [4, 6, 8]
    printf "%s -> %s\n" (show a) $ show $ dropOdd a
    printf "%s -> %s\n" (show b) $ show $ dropOdd b
    printf "%s -> %s\n" (show c) $ show $ dropOdd c
    printf "%s -> %s\n" (show d) $ show $ dropOdd d
