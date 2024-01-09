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

-- | Compose a function with itself n times.
compose :: Int -> (a -> a) -> (a -> a)
compose n f = foldr (\g acc -> acc . g) f functionList
  where
    functionList = replicate n f

-- | Double a number.
double :: Num a => a -> a
double x = 2 * x

-- | Compose a function with itself.
main = do
    let [a, b, c, d] = [8, 3, 5, 2] :: [Integer]
    let [j, k, m, n] = [-1, 0, 1, 2] :: [Int]
    let aa = (compose k double) a
    let ab = double a
    let ba = (compose m double) b
    let bb = double . double $ b
    let ca = (compose n double) c
    let cb = double . double . double $ c
    let da = (compose j double) d
    let db = double d
    let testa = aa == ab
    let testb = ba == bb
    let testc = ca == cb
    let testd = da == db
    printf "%d -> %d, %s\n" a aa $ show testa
    printf "%d -> %d, %s\n" b ba $ show testb
    printf "%d -> %d, %s\n" c ca $ show testc
    printf "%d -> %d, %s\n" d da $ show testd
