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
import Data.List
import System.Random.Stateful
import Text.Printf

-- | Binary search a sorted list.
binSearch :: Integral a => [a] -> a -> Bool
binSearch [] _ = False
binSearch [x] y = x == y
binSearch xs y = do
    let k = (length xs) `div` 2
    let (left, right) = splitAt k xs
    if y <= last left
        then binSearch left y
        else binSearch right y

-- | Generate random integers.
randint :: Int -> IO [Int]
randint n = replicateM n (uniformRM (1, 10000) globalStdGen :: IO Int)

-- | Binary search.
main = do
    let b = [2] :: [Int]
    let c = [1 .. 10] :: [Int]
    let target = [0 .. 11] :: [Int]
    -- Empty list.
    putStrLn "Empty list"
    let a = [] :: [Int]
    let ak = 1 :: Int
    printf "%s, %d -> %s\n" (show a) ak $ show $ binSearch a ak == (ak `elem` a)
    -- List of one element.
    putStrLn "\nList of 1 element"
    b <- randint 1
    let bk = head b
    let bl = bk + 1
    let bm = bk - 1
    printf "%s, %d -> %s\n" (show b) bk $ show $ binSearch b bk == (bk `elem` b)
    printf "%s, %d -> %s\n" (show b) bl $ show $ binSearch b bl == (bl `elem` b)
    printf "%s, %d -> %s\n" (show b) bm $ show $ binSearch b bm == (bm `elem` b)
    -- List of multiple elements.
    putStrLn "\nList with multiple elements"
    r <- randint 10
    let c = sort r
    let ck = head r
    let cl = (head c) - 1
    let cm = (last c) + 1
    printf "%s, %d -> %s\n" (show c) ck $ show $ binSearch c ck == (ck `elem` c)
    printf "%s, %d -> %s\n" (show c) cl $ show $ binSearch c cl == (cl `elem` c)
    printf "%s, %d -> %s\n" (show c) cm $ show $ binSearch c cm == (cm `elem` c)
