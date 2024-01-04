--------------------------------------------------------------------------------
-- MIT License
--
-- Copyright (C) 2023--2024 Duck McSouls <quacksouls [AT] gmail [DOT] com>
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

import Control.Monad
import Data.Foldable
import System.Random.Stateful
import Text.Printf

-- | Whether an integer is a multiple of another integer.
isMultiple :: Integer -> Integer -> Bool
isMultiple n k = mod n k == 0

-- | Remove duplicates from a list.
unique :: [Integer] -> [Integer]
unique [] = []
unique (x:xs)
    | x `elem` xs = unique xs
    | otherwise = x : unique xs

-- | The positive integer multiples of a bunch of numbers.
multiples :: [Integer] -> [Integer] -> [Integer]
multiples [] _ = error "Must be non-empty list"
multiples _ [] = error "Must be non-empty list"
multiples [x] ys = filter (\z -> isMultiple z x) ys
multiples (x:xs) ys = multiples xs zs
  where
    zs = filter (\z -> isMultiple z x) ys

-- | The positive integer multiples of a bunch of numbers.  This implementation
-- uses list comprehension.
multiplesC :: [Integer] -> [Integer] -> [Integer]
multiplesC [] _ = error "Must be non-empty list"
multiplesC _ [] = error "Must be non-empty list"
multiplesC [x] ys = [z | z <- ys, isMultiple z x]
multiplesC (x:xs) ys = multiplesC xs zs
  where
    zs = [z | z <- ys, isMultiple z x]

-- | A bunch of random integers.
randInts :: Int -> IO [Integer]
randInts n = replicateM n (uniformRM (2, 10) globalStdGen :: IO Integer)

-- | Problems relating to multiples of a bunch of integers.
main = do
    let divisor = [[2], [2, 3], [2 .. 4], [2 .. 5], [2 .. 6], [2 .. 7], [2 .. 8], [2 .. 9]]
    -- The least positive integer that is divisible by a bunch of numbers.
    for_ divisor $ \d -> do
        let ell = multiples d [1 ..]
        let ellC = multiplesC d [1 ..]
        let test = head ell == head ellC
        printf "Least multiple of %s: %d, %s\n" (show d) (head ell) $ show test
    -- How precious is a bunch of integers?
    k <- uniformRM (1, 10) globalStdGen :: IO Int
    ell <- randInts k
    let ellu = unique ell
    let n = product ellu
    let mult = multiples ellu [1 .. n]
    printf "Value of %s = %d\n" (show ellu) $ sum mult
