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

import Control.Monad
import Data.Foldable
import System.Random.Stateful
import Text.Printf

-- | The greatest common divisor (GCD) of two positive integers, using repeated
-- integer division.
gcdMod :: Integral a => a -> a -> a
gcdMod a 0 = a
gcdMod a b
    | a == b = a
    | a > b = gcdMod b $ a `mod` b
    | otherwise = gcdMod a $ b `mod` a

-- | The greatest common divisor (GCD) of two positive integers, using repeated
-- subtraction.
gcdSub :: Integral a => a -> a -> a
gcdSub a b
    | a == b = a
    | otherwise = do
        let ai = max b $ abs $ a - b
        let bi = min b $ abs $ a - b
        gcdSub ai bi

-- | Generate random integers.
randint :: Int -> IO [Int]
randint n = replicateM n (uniformRM (1, 10000) globalStdGen :: IO Int)

-- | The greatest common divisors of pairs of integers.
main = do
    let n = 100 :: Int
    a <- randint n
    b <- randint n
    let s = map (\(n, k) -> gcdSub n k) $ zip a b
    let t = map (\(n, k) -> gcdMod n k) $ zip a b
    let u = map (\(n, k) -> gcd n k) $ zip a b
    for_ (zip3 s t u) $ \(x, y, z) -> do
        printf "check: %s\n" $ show $ x == y && x == z
