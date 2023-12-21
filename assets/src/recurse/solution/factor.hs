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

import Data.List
import System.Random.Stateful
import Text.Printf

-- | All factors of a positive integer.  Use a faster algorithm.
factors :: Integer -> Integer -> [Integer]
factors n k
    | n < 1 || k < 1 = error "Must be positive integer"
    | k <= (ceiling $ sqrt $ fromInteger n) =
        if isFactor n k
            then [k, n `div` k] ++ factors n (k + 1)
            else [] ++ factors n (k + 1)
    | otherwise = []

-- | All factors of a positive integer.  Use a naive algorithm by searching
-- through all integers from 1 up to n.
factorsNaive ::
       Integer -- ^ Determine the factors of this integer.
    -> Integer -- ^ Start our search from this integer.
    -> [Integer] -- ^ All the factors of the first integer.
factorsNaive n k
    | n < 1 || k < 1 = error "Must be positive integer"
    | otherwise = do
        let m = nextFactor n k
        if m < n
            then [m] ++ factorsNaive n (m + 1)
            else [m]

-- | Whether an integer is a factor of another integer.
isFactor ::
       Integer -- ^ An integer to test.
    -> Integer -- ^ Test to see whether this integer is a factor.
    -> Bool -- ^ True if the first integer can be divided by the second; false otherise.
isFactor n k = mod n k == 0

-- | A factor of an integer.
nextFactor ::
       Integer -- ^ Determine a factor of this integer.
    -> Integer -- ^ Test this integer to see whether it is a factor.
    -> Integer -- ^ A factor of the first integer.
nextFactor n k
    | n < 1 || k < 1 = error "Must be positive integer"
    | k >= n = n
    | k == 1 = k
    | mod n k == 0 = k
    | otherwise = nextFactor n (k + 1)

-- | All factors of a positive integer.
main = do
    n <- uniformRM (1, 1000) globalStdGen
    printf "factors of %d\n" n
    printf "Naive: %s\n" $ show $ factorsNaive n 1
    printf "Effic: %s\n" $ show $ sort $ factors n 1
