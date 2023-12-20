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

-- | Flip a coin a given number of times. 1 means heads, 0 means tail.
flipCoin :: Int -> IO [Integer]
flipCoin n = replicateM n (uniformRM (0, 1) globalStdGen)

-- | The fraction of heads obtained in a given number of coin tosses.
main = do
    let n = 100 :: Int
    coin <- flipCoin n
    let nheads = (fromIntegral $ sum coin) :: Double
    let frac = nheads / (fromIntegral n :: Double)
    printf "Tosses: %d\n" n
    printf "Heads: %d\n" $ sum coin
    printf "Fraction: %f\n" frac
    -- A large number of coin tosses.
    let k = 10000 :: Int
    kcoin <- flipCoin k
    let kheads = (fromIntegral $ sum kcoin) :: Double
    let kfrac = kheads / (fromIntegral k :: Double)
    printf "\nTosses: %d\n" k
    printf "Heads: %d\n" $ sum kcoin
    printf "Fraction: %f\n" kfrac
