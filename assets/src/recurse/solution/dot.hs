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

-- | The dot product of two lists.
dot :: Num a => [a] -> [a] -> a
dot [] [] = 0
dot [] _ = error "Lists must have same length"
dot _ [] = error "Lists must have same length"
dot (x:xs) (y:ys)
    | length xs /= length ys = error "Lists must have same length"
    | otherwise = (x * y) + dot xs ys

-- | The dot product of two lists, using a fold operation.
dotf :: Num a => [a] -> [a] -> a
dotf [] [] = 0
dotf [] _ = error "Lists must have same length"
dotf _ [] = error "Lists must have same length"
dotf xs ys
    | length xs /= length ys = error "Lists must have same length"
    | otherwise = foldr (\(x, y) acc -> acc + (x * y)) 0 $ zip xs ys

-- | Generate random integers.
randint :: Int -> IO [Integer]
randint n = replicateM n (uniformRM (1, 100) globalStdGen)

-- | Generate random floating-point numbers.
randfloat :: Int -> IO [Double]
randfloat n = replicateM n (uniformRM (1, 100) globalStdGen :: IO Double)

-- | The dot product.
main = do
    aa <- randint 4
    ab <- randint 4
    ba <- randfloat 3
    bb <- randfloat 3
    let ca = [1] :: [Int]
    let cb = [2] :: [Int]
    let da = [] :: [Int]
    let testa = dot aa ab == dotf aa ab
    let testb = dot ba bb == dotf ba bb
    let testc = dot ca cb == dotf ca cb
    let testd = dot da da == dotf da da
    printf "%s . %s -> %d: %s\n" (show aa) (show ab) (dot aa ab) $ show testa
    printf "%s . %s -> %f: %s\n" (show ba) (show bb) (dot ba bb) $ show testb
    printf "%s . %s -> %d: %s\n" (show ca) (show cb) (dot ca cb) $ show testc
    printf "[] . [] -> %d: %s\n" (dot da da) $ show testd
