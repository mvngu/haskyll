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

-- | Recursive formulation of the binomial coefficients.
binom :: Integer -> Integer -> Integer
binom n 0 = 1
binom 0 k = 0
binom n k
    | n < 0 = error "Must be non-negative integer"
    | (k > n) || (k < 0) = 0
    | n == k = 1
    | otherwise = (n * binom (n - 1) (k - 1)) `div` k

-- | The Catalan numbers, recursive version.
catalanA :: Integer -> Integer
catalanA 0 = 1
catalanA n = do
    let a = 2 * (2 * n - 1)
    let numerator = a * (catalanA $ n - 1)
    numerator `div` (n + 1)

-- | The Catalan numbers, expressed in terms of the central binomial
-- coefficients.
catalanB :: Integer -> Integer
catalanB n = (binom (2 * n) n) `div` (n + 1)

-- | The Catalan numbers, expressed in terms of the difference of two binomial
-- coefficients.
catalanC :: Integer -> Integer
catalanC n = (binom (2 * n) n) - (binom (2 * n) $ n + 1)

-- | Various formulae for the Catalan numbers.
main = do
    for_ [0 .. 11] $ \n -> do
        let catA = catalanA n
        let catB = catalanB n
        let catC = catalanC n
        printf "%d -> %d: %s\n" n catA $ show $ catA == catB && catA == catC
