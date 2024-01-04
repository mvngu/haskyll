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

-- | The least element in a list.
least :: [Int] -> Int
least [] = error "Must be non-empty list"
least [x] = x
least (x:xs) =
    if x > head xs
        then least xs
        else least $ x : tail xs

-- | The least element in a list, using a fold operation.
leastf :: [Int] -> Int
leastf []     = error "Must be non-empty list"
leastf [x]    = x
leastf (x:xs) = foldr (\y acc -> myMin y acc) x xs

-- | The minimum of two integers.
myMin :: Int -> Int -> Int
myMin x y
    | x < y = x
    | otherwise = y

-- | Generate random integers.
randint :: Int -> IO [Int]
randint n = replicateM n (uniformRM (1, 1000) globalStdGen :: IO Int)

-- | The minimum of a list.
main = do
    kk <- randint 1
    let k = head kk
    for_ [1 .. k] $ \_ -> do
        ell <- randint 10
        let low = least ell
        let result = low == minimum ell && low == leastf ell
        if result
            then printf "%s -> %d: %s\n" (show ell) low $ show result
            else error "False"
