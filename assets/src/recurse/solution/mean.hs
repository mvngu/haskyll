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
import System.Random.Stateful
import Text.Printf

-- | The arithmetic mean, using a fold operation.
average :: Integral a => [a] -> Double
average [] = 0
average xs = numerator / denominator
  where
    numerator = fromIntegral $ foldr (\x acc -> x + acc) 0 xs
    denominator = fromIntegral $ foldr (\_ acc -> 1 + acc) 0 xs

-- | The arithmetic mean.
mean :: Integral a => [a] -> Double
mean [] = 0
mean xs = numerator / denominator
  where
    numerator = fromIntegral $ sum xs
    denominator = fromIntegral $ length xs

-- | A bunch of random integers.
randint :: Int -> IO [Int]
randint n = replicateM n (uniformRM (1, 100) globalStdGen :: IO Int)

-- | Various implementations of arithmetic mean.
main = do
    let a = []
    let b = [42]
    let c = [1, 2]
    d <- randint 10
    e <- randint 1000
    let testa = average a == mean a
    let testb = average b == mean b
    let testc = average c == mean c
    let testd = average d == mean d
    let teste = average e == mean e
    printf "%f: %s\n" (average a) $ show testa
    printf "%f: %s\n" (average b) $ show testb
    printf "%f: %s\n" (average c) $ show testc
    printf "%f: %s\n" (average d) $ show testd
    printf "%f: %s\n" (average e) $ show teste
