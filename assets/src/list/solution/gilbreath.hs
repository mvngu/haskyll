--------------------------------------------------------------------------------
-- MIT License
--
-- Copyright (C) 2024 Duck McSouls <quacksouls [AT] gmail [DOT] com>
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

-- | Whether a list has all ones.
allOne :: Integral a => [a] -> Bool
allOne [] = False
allOne xs = and [x == 1 | x <- xs]

-- | The difference operator, where we use only the absolute value of the
-- difference.
diff :: Integral a => [a] -> [a]
diff []       = []
diff [x]      = []
diff [x, y]   = [abs $ x - y]
diff (x:y:xs) = [abs $ x - y] ++ diff (y : xs)

-- | A Gilbreath sequence, where we have applied the difference operator to a
-- list of integers. The sequence satisfies the given predicate.
gilbreath :: Integral a => ([a] -> Bool) -> a -> [a] -> (a, [a])
gilbreath f n [] = (n, [])
gilbreath f n [x] = (n, [x])
gilbreath f n xs
    | f xs = (n, xs)
    | otherwise = gilbreath f (n + 1) $ diff xs

-- | Whether a list contains only ones and zeros.
isBinary :: Integral a => [a] -> Bool
isBinary [] = False
isBinary xs = and [x == 1 || x == 0 | x <- xs]

-- | Whether a list contains only 0, 1, and 2.
is012 :: Integral a => [a] -> Bool
is012 [] = False
is012 xs = and [x == 2 || x == 1 || x == 0 | x <- xs]

-- | A list of prime numbers between 2 and a given limit.  This implementation
-- uses list comprehension.
prime :: Integral a => a -> [a]
prime n
    | n < 2 = error "Must be integer at least 2"
    | otherwise = sieve [2 .. n]

-- | The sieve of Eratosthenes, but using list comprehension.
sieve :: Integral a => [a] -> [a]
sieve []     = []
sieve (x:xs) = x : sieve [y | y <- xs, mod y x /= 0]

-- | Whether a list has at least a zero.
someZero :: Integral a => [a] -> Bool
someZero [] = False
someZero xs = or [x == 0 | x <- xs]

-- | Generate a list of prime numbers using the sieve of Eratosthenes.  Use the
-- prime numbers to experiment with Gilbreath's conjecture.
main = do
    let limit = [10, 100, 1000, 10000, 100000] :: [Integer]
    for_ limit $ \n -> do
        let ell = prime n
        let (a, seqA) = gilbreath allOne 0 ell
        let (b, seqB) = gilbreath someZero 0 ell
        let (c, seqC) = gilbreath isBinary 0 ell
        let (d, seqD) = gilbreath is012 0 ell
        printf "Primes <= %d\n" n
        printf "All ones -> %d\n" a
        printf "Some zeros -> %d\n" b
        printf "Binary -> %d\n" c
        printf "Only 0-1-2 -> %d\n\n" d
