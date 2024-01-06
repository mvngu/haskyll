--------------------------------------------------------------------------------
-- MIT License
--
-- Copyright (C) 2024 Aaron Nguyen <mvngu [AT] gmx [DOT] com>
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

import Data.Foldable
import Text.Printf

-- | Various operations on a list.  This implementation uses a case expression.
mlistc :: Integral a => [a] -> a
mlistc xs =
    case length xs of
        0 -> 0
        1 -> (xs !! 0) ^ 2
        2 -> product xs
        _ -> sum xs

-- | Various operations on a list.  This implementation uses a guarded
-- equation.
mlistg :: Integral a => [a] -> a
mlistg xs
    | size == 0 = 0
    | size == 1 = (xs !! 0) ^ 2
    | size == 2 = product xs
    | otherwise = sum xs
  where
    size = length xs

-- | Various operations on a list.  This implementation uses conditional
-- expression.
mlisti :: Integral a => [a] -> a
mlisti xs =
    if size == 0
        then 0
        else if size == 1
                 then (xs !! 0) ^ 2
                 else if size == 2
                          then product xs
                          else sum xs
  where
    size = length xs

-- | Various operations on a list.  This implementation uses pattern matching.
mlistp :: Integral a => [a] -> a
mlistp []     = 0
mlistp [x]    = x ^ 2
mlistp [x, y] = x * y
mlistp xs     = sum xs

-- | Process a list and perform various mathematical operations on the
-- elements.
main = do
    let a = [] :: [Integer]
    let b = [3] :: [Integer]
    let c = [2, 5] :: [Integer]
    let d = [2, 3, 5, 7] :: [Integer]
    let mla = mlistc a
    let mlb = mlistc b
    let mlc = mlistc c
    let mld = mlistc d
    let testa = mla == mlistg a && mla == mlisti a && mla == mlistp a
    let testb = mlb == mlistg b && mlb == mlisti b && mla == mlistp a
    let testc = mlc == mlistg c && mlc == mlisti c && mla == mlistp a
    let testd = mld == mlistg d && mld == mlisti d && mla == mlistp a
    printf "[] -> %d, %s\n" mla $ show testa
    printf "%s -> %d, %s\n" (show b) mlb $ show testb
    printf "%s -> %d, %s\n" (show c) mlc $ show testc
    printf "%s -> %d, %s\n" (show d) mld $ show testd
