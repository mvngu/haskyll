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

import Data.Char
import Text.Printf

-- | An implementation of the function "map".
imap :: (a -> b) -> [a] -> [b]
imap _ []     = []
imap f (x:xs) = [f x] ++ imap f xs

-- | An implementation of the function "map".  We use a fold operation.
imapf :: (a -> b) -> [a] -> [b]
imapf f xs = foldr (\x acc -> f x : acc) [] xs

-- | Current prices of items below $100.
price = [5.00, 7.25, 10.95, 49.99, 99.95] :: [Double]

-- | Round a price to 2 decimal places.
roundPrice :: Double -> Double
roundPrice p = numerator / factor
  where
    factor = 10.0 ^ 2
    numerator = fromIntegral . round $ p * factor

-- | My homemade "map".
main = do
    let aa = [1 .. 10]
    -- Increment each number by 1.
    let ab = imap (\x -> x + 1) aa
    let testa = ab == imapf (\x -> x + 1) aa
    printf "%s -> %s, %s\n" (show aa) (show ab) $ show testa
    -- Apply a discount on various items.
    let newPrice = imap (\x -> roundPrice $ 0.85 * x) price
    let testPrice = newPrice == imapf (\x -> roundPrice $ 0.85 * x) price
    printf "%s -> %s, %s\n" (show price) (show newPrice) $ show testPrice
    -- capitalize some names.
    let name = ["ava", "bella", "cleo"]
    let capitalize = imap (\str -> (toUpper $ head str) : tail str) name
    let testName = capitalize == imapf (\str -> (toUpper $ head str) : tail str) name
    printf "%s -> %s, %s\n" (show name) (show capitalize) $ show testName
    -- Reverse various strings.
    let str = ["Anna", "def", "live"]
    let rvrs = imap reverse str
    let testReverse = rvrs == imapf reverse str
    printf "%s -> %s, %s\n" (show str) (show rvrs) $ show testReverse
    -- concatenate some strings.
    let pair = [("pre", "view"), ("re", "do"), ("anti", "c")]
    let together = imap (\(s, t) -> s ++ t) pair
    let testTo = together == imapf (\(s, t) -> s ++ t) pair
    printf "%s -> %s, %s\n" (show pair) (show together) $ show testTo
