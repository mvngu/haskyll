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

import Text.Printf

-- | All proper factors of an integer.
profactor :: Integer -> [Integer]
profactor n
    | n < 2 = error "Must be integer > 1"
    | otherwise = [x | x <- [2 .. (n - 1)], mod n x == 0]

-- | Whether a number is prime.
isPrime :: Integer -> Bool
isPrime n
    | n < 2 = error "Must be integer > 1"
    | otherwise = 0 == (length . profactor $ n)

-- | A list of all primes not exceeding a given limit.
prime :: Integer -> [Integer]
prime n = [x | x <- [2 .. n], isPrime x]

-- | Generate a list of prime numbers not exceeding a given number.
main = do
    let ell = prime 100
    printf "%s\n" $ show ell
