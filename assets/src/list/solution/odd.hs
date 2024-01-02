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

import Data.Foldable
import Text.Printf

-- | Express an odd integer n > 0 as the difference of two squares.  This
-- implementation uses a list comprehension.
diffSqC :: Integral a => a -> (a, a)
diffSqC n
    | n < 1 || even n = error "Must be odd positive integer"
    | otherwise = head [(x, y) | x <- [0 .. n], y <- [0 .. n], x ^ 2 - y ^ 2 == n]

-- | Express an odd integer n > 0 as the difference of two squares.  This
-- implementation does not use a list comprehension, but a filter.
diffSqF :: Integral a => a -> (a, a)
diffSqF n
    | n < 1 || even n = error "Must be odd positive integer"
    | otherwise = do
        let pair = sequence [[0 .. n], [0 .. n]]
        let tuple = head $ filter (\[x, y] -> x ^ 2 - y ^ 2 == n) pair
        (head tuple, last tuple)

-- | Every odd positive integer can be written as the difference of two squares.
main = do
    let odd = [1,3 .. 100] :: [Integer]
    for_ odd $ \n -> do
        let (x, y) = diffSqC n
        let test = (x, y) == diffSqF n
        printf "%d -> %d^2 - %d^2: %s\n" n x y $ show test
