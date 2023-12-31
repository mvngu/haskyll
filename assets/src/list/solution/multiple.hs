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

import Data.Foldable
import Text.Printf

-- | Whether an integer is a multiple of another integer.
isMultiple :: Integer -> Integer -> Bool
isMultiple n k = mod n k == 0

-- | The positive integer multiples of a bunch of numbers.
multiples :: [Integer] -> [Integer] -> [Integer]
multiples [] _ = error "Must be non-empty list"
multiples _ [] = error "Must be non-empty list"
multiples [x] ys = filter (\z -> isMultiple z x) ys
multiples (x:xs) ys = do
    let zs = filter (\z -> isMultiple z x) ys
    multiples xs zs

-- | The least positive integer that is divisible by a bunch of numbers.
main = do
    let divisor = [[2], [2, 3], [2 .. 4], [2 .. 5], [2 .. 6], [2 .. 7], [2 .. 8], [2 .. 9]]
    for_ divisor $ \d -> do
        let ell = multiples d [1 ..]
        printf "Least multiple of %s: %d\n" (show d) $ head ell
