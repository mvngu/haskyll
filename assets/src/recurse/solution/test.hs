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

-- | Whether a person passes a test.
pass :: [Double] -> [Int]
pass xs =
    map (\x ->
             if x < 0.75
                 then 0 :: Int
                 else 1 :: Int)
        xs

-- | Simulate the test results for a given number of people.
testResult :: Int -> IO [Double]
testResult n = replicateM n $ uniformDouble01M globalStdGen

-- | Simulate the fraction of people who pass a test.
main = do
    let n = 100 :: Int
    result <- testResult n
    let npass = sum $ pass result
    let frac = (fromIntegral npass :: Double) / (fromIntegral n :: Double)
    printf "Fraction of passed: %f\n" frac
