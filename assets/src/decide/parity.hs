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

import Text.Printf

-- | Whether an integer is even or odd.  This implementation uses a case
-- expression.
parity :: Int -> String
parity n =
    case mod n 2 == 0 of
        True  -> "even"
        False -> "odd"

-- | Whether an integer is even or odd.  This implementation uses a conditional
-- expression.
parityc :: Int -> String
parityc n =
    if mod n 2 == 0
        then "even"
        else "odd"

-- | Whether an integer is even or odd.  This implementation uses a guarded
-- equation.
parityg :: Int -> String
parityg n
    | mod n 2 == 0 = "even"
    | otherwise = "odd"

-- | Whether an integer is even or odd.  This implementation uses a case
-- expression and the "where" clause.
parityw :: Int -> String
parityw n =
    case isZero of
        True  -> "even"
        False -> "odd"
  where
    isZero = mod n 2 == 0

-- | Testing an integer to see whether it is even or odd.  We use various
-- implementations for the test.
main = do
    let [a, b, c, d] = [-2, 0, 2, 5] :: [Int]
    let [pa, pb, pc, pd] = [parity a, parity b, parity c, parity d]
    let testa = pa == parityc a && pa == parityg a && pa == parityw a
    let testb = pb == parityc b && pb == parityg b && pb == parityw b
    let testc = pc == parityc c && pc == parityg c && pc == parityw c
    let testd = pd == parityc d && pd == parityg d && pd == parityw d
    printf "%d -> %s, %s\n" a (parity a) $ show testa
    printf "%d -> %s, %s\n" b (parity b) $ show testb
    printf "%d -> %s, %s\n" c (parity c) $ show testc
    printf "%d -> %s, %s\n" d (parity d) $ show testd
