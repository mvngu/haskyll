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

-- | Solution to the Towers of Hanoi puzzle.
hanoi :: Integer -> Integer
hanoi 1 = 1
hanoi n
    | n < 1 = error "Must be positive integer"
    | otherwise = (2 * (hanoi $ n - 1)) + 1

-- | Generate random integers.
randint :: Int -> IO [Integer]
randint n = replicateM n (uniformRM (1, 10000) globalStdGen)

-- | Solution to the Towers of Hanoi puzzle.
main = do
    a <- randint 10
    for_ a $ \n -> do
        printf "%d: %s\n" n $ show $ hanoi n == (2 ^ n) - 1
