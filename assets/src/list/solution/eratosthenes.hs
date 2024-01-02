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

-- | Whether a list has all ones.
allOne :: [Integer] -> Bool
allOne []     = False
allOne [x]    = x == 1
allOne (x:xs) = x == 1 && allOne xs

-- | Let p_n be the n-th prime number. Test whether the inequality
--
-- \sqrt{p_{n+1}} - \sqrt{p_n} < 1
--
-- holds for a list of successive primes, in order to verify Andrica's
-- conjecture.
andrica :: [Integer] -> [Bool]
andrica []       = []
andrica [x]      = [False]
andrica [x, y]   = [isLTone x y]
andrica (x:y:xs) = [isLTone x y] ++ andrica (y : xs)

-- | The difference operator, where we use only the absolute value of the
-- difference.
diff :: [Integer] -> [Integer]
diff []       = []
diff [x]      = []
diff [x, y]   = [abs $ x - y]
diff (x:y:xs) = [abs $ x - y] ++ diff (y : xs)

-- | A Gilbreath sequence, which consists of the first element obtained after
-- running the difference operator on a list.
gilbreath :: [Integer] -> [Integer]
gilbreath [] = []
gilbreath [x] = [x]
gilbreath xs = do
    let d = diff xs
    (head d) : gilbreath d

-- | Let p_n be the n-th prime number. Test whether the inequality
--
-- \sqrt{p_{n+1}} - \sqrt{p_n} < 1
--
-- holds for the purpose of Andrica's conjecture.
isLTone :: Integer -> Integer -> Bool
isLTone x y = (sqrt . fromIntegral $ y) - (sqrt . fromIntegral $ x) < 1

-- | A list of prime numbers between 2 and a given limit.
prime :: Integer -> [Integer]
prime n
    | n < 2 = error "Must be integer at least 2"
    | otherwise = sieve [2 .. n]

-- | A list of prime numbers between 2 and a given limit.  This implementation
-- uses list comprehension.
primeC :: Integer -> [Integer]
primeC n
    | n < 2 = error "Must be integer at least 2"
    | otherwise = sieveC [2 .. n]

-- | The sieve of Eratosthenes.
sieve :: [Integer] -> [Integer]
sieve []     = []
sieve (x:xs) = x : (sieve $ filter (\y -> mod y x /= 0) xs)

-- | The sieve of Eratosthenes, but using list comprehension.
sieveC :: [Integer] -> [Integer]
sieveC []     = []
sieveC (x:xs) = x : sieveC [y | y <- xs, mod y x /= 0]

-- | Twin primes.
twin :: Integer -> [(Integer, Integer)]
twin n
    | n < 2 = error "Must be positive integer"
    | otherwise = do
        let p = primeC n
        let pair = zip p (tail p)
        [(x, y) | (x, y) <- pair, y - x == 2]

-- | Generate a list of prime numbers using the sieve of Eratosthenes.  Use the
-- prime numbers to verify various conjectures.
main = do
    let k = 100
    let p = prime k
    printf "%s -> %s\n" (show p) $ show $ p == primeC k
    -- Verify Gilbreath's conjecture for a list of all primes between 2 and
    -- 100,000.
    let n = 100000
    let ell = prime n
    let result = allOne . gilbreath $ ell
    printf "Gilbreath's conjecture for primes <= 100,000: %s\n" $ show result
    -- Verify Andrica's conjecture for a list of all primes at most 100,000
    let ella = andrica ell
    printf "Andrica's conjecture for primes <= 100,000: %s\n" $ show . and $ ella
    -- Twin primes.
    printf "%s\n" $ show $ take 100 $ twin n
